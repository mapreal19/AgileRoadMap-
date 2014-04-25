namespace :db do
  desc "Create fake users"
  task fake_users: :environment do

    #  User.all.where("email LIKE ? ", 'yopolt-%@faker.com')
    30.times do |n|
      name  = Faker::Name.name
      email = "yopolt-#{n+1}@faker.com"
      password  = "password"
      ip = Faker::Internet.ip_v4_address
      ambito_trabajo = 1 + rand(AmbitoTrabajo.all.count)
      sector_empresa = 1 + rand(SectorEmpresa.all.count)
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   ip: ip,
                   ambito_trabajo_id: ambito_trabajo,
                   sector_empresa_id: sector_empresa,
                   miembros_equipo: rand(1000)
      )
    end
  end

end
