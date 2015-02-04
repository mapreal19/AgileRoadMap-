class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token

  scope :without_yopolt, -> { where("email NOT LIKE ? ", 'yopolt%') }

	has_many :user_practicas, -> { order("position") }, dependent: :destroy
	has_many :user_objetivos, -> { order("position") }, dependent: :destroy
  belongs_to :ambito_trabajo
  belongs_to :sector_empresa

	validates :name, presence: true, length: { maximum: 50 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
	uniqueness: { case_sensitive: false }

  validates_presence_of :ambito_trabajo_id, :sector_empresa_id, :miembros_equipo, on: :create

  validates :miembros_equipo, numericality: { greater_than: 0 }, on: :create

	has_secure_password
	validates :password, length: { minimum: 6 }

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def clone_practicas
		all_practicas = Practica.all

		all_practicas.each do |practica|
			self.user_practicas.build(practica_id: practica.id, name: practica.name,
				agile_method: practica.agile_method, 
				position: practica.position, 
				legacy_position: practica.position,
				effort: practica.effort,
				range: -1).save
		end
	end

	def clone_objetivos
		all_objetivos = Objetivo.all

		index = 1
		all_objetivos.each do |objetivo|
			self.user_objetivos.build(
				objetivo_id: objetivo.id, 
				position: index
				).save
			index += 1
		end
  end

  def self.get_size_team_stats
    size_teams = {}
    key = nil
    User.without_yopolt.each do |user|
      # 1-5, 6-10, 11-20, > 20
      case user.miembros_equipo
        when 1..5 then key = '1-5'
        when 6..10 then key = '6-10'
        when 11..20 then key = '11-20'
        else key = '> 20'
      end
      size_teams[key] ||= 0
      size_teams[key] += 1
    end
    size_teams
  end

  def self.get_countries_stats
    user_countries = {}
    User.without_yopolt.each do |user|
      result = JSON.parse(
          open("http://ip-api.com/json/#{user.ip}")
          .read
      )
      country = result["country"]
      user_countries[country] ||= 0
      user_countries[country] += 1
    end
    user_countries
  end

  def self.get_ambito_trabajo_stats
    user_ambitos = User.without_yopolt.group(:ambito_trabajo_id).count

    if I18n.locale == :es
      mappings = AmbitoTrabajo.all.pluck(:id, :name_es)
    else
      mappings = AmbitoTrabajo.all.pluck(:id, :name_en)
    end
    hash_mappings = {}
    mappings.each do |mapping|
      hash_mappings[mapping[0]] = mapping[1]
    end

    user_ambitos = Hash[user_ambitos.map {|k, v| [hash_mappings[k], v] }]
  end

  def self.get_sector_empresa_stats
    user_sectores = User.without_yopolt.group(:sector_empresa_id).count

    if I18n.locale == :es
      mappings = SectorEmpresa.all.pluck(:id, :name_es)
    else
      mappings = SectorEmpresa.all.pluck(:id, :name_en)
    end
    
    hash_mappings = {}
    mappings.each do |mapping|
      hash_mappings[mapping[0]] = mapping[1]
    end

    user_sectores = Hash[user_sectores.map {|k, v| [hash_mappings[k], v] }]
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
    	end while User.exists?(column => self[column])
  	end
end
