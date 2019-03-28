class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  scope :without_yopolt, -> { where('email NOT LIKE ? ', 'yopolt%') }

  has_many :user_practicas, -> { order('position') }, dependent: :destroy
  has_many :user_objetivos, -> { order('position') }, dependent: :destroy
  belongs_to :ambito_trabajo
  belongs_to :sector_empresa

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze
  validates :email,
            presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  validates :ambito_trabajo_id, :sector_empresa_id, :miembros_equipo, presence: { on: :create }

  validates :miembros_equipo, numericality: { greater_than: 0 }, on: :create

  has_secure_password
  validates :password, length: { minimum: 6 }

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def clone_practicas
    UserPractica.acts_as_list_no_update do
      Practica.find_each do |practica|
        user_practicas.build(
          practica_id: practica.id,
          name_es: practica.name_es,
          name_en: practica.name_en,
          agile_method: practica.agile_method,
          position: practica.position,
          legacy_position: practica.position,
          effort: practica.effort,
          range: -1
        ).save!
      end
    end
  end

  def clone_objetivos
    UserObjetivo.acts_as_list_no_update do
      Objetivo.find_each.with_index(1) do |objetivo, index|
        user_objetivos.build(
          objetivo_id: objetivo.id,
          position: index
        ).save!
      end
    end
  end

  def self.get_size_team_stats
    size_teams = {}
    User.without_yopolt.each do |user|
      key = case user.miembros_equipo
            when 1..5 then
              '1-5'
            when 6..10 then
              '6-10'
            when 11..20 then
              '11-20'
            else
              '> 20'
            end
      size_teams[key] ||= 0
      size_teams[key] += 1
    end
    size_teams
  end

  def self.get_ambito_trabajo_stats
    user_ambitos = User.without_yopolt.group(:ambito_trabajo_id).count

    mappings = if I18n.locale == :es
                 AmbitoTrabajo.all.pluck(:id, :name_es)
               else
                 AmbitoTrabajo.all.pluck(:id, :name_en)
               end
    hash_mappings = {}
    mappings.each do |mapping|
      hash_mappings[mapping[0]] = mapping[1]
    end

    Hash[user_ambitos.map { |k, v| [hash_mappings[k], v] }]
  end

  def self.get_sector_empresa_stats
    user_sectores = User.without_yopolt.group(:sector_empresa_id).count

    mappings = if I18n.locale == :es
                 SectorEmpresa.all.pluck(:id, :name_es)
               else
                 SectorEmpresa.all.pluck(:id, :name_en)
               end

    hash_mappings = {}
    mappings.each do |mapping|
      hash_mappings[mapping[0]] = mapping[1]
    end

    Hash[user_sectores.map { |k, v| [hash_mappings[k], v] }]
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!(validate: false)
    UserMailer.password_reset(self).deliver
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column: self[column])
  end
end
