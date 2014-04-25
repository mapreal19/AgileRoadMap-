namespace :db do
  desc "Create fake users"
  task fake_users: :environment do

    # Borramos si ya han sido creados. Destroy para activar callbacks
    #  User.all.where("email LIKE ? ", 'yopolt-%@faker.com')
    User.where("email LIKE ? ", 'yopolt-%@faker.com').destroy_all

    objetivos_length = Objetivo.all.count
    practicas_length = Practica.all.count

    30.times do |n|
      name = Faker::Name.name
      email = "yopolt-#{n+1}@faker.com"
      password = "password"
      ip = Faker::Internet.ip_v4_address
      ambito_trabajo = 1 + rand(AmbitoTrabajo.all.count)
      sector_empresa = 1 + rand(SectorEmpresa.all.count)
      user = User.create!(name: name,
                          email: email,
                          password: password,
                          password_confirmation: password,
                          ip: ip,
                          ambito_trabajo_id: ambito_trabajo,
                          sector_empresa_id: sector_empresa,
                          miembros_equipo: rand(1000)
      )

      user.clone_practicas
      user.clone_objetivos

      # 6 ordenamientos aleatorios de objetivos
      6.times do |i|
        objetivo = user.user_objetivos[1 + rand(objetivos_length)]
        objetivo.insert_at(1 + rand(objetivos_length))
      end

      # 10 ordenamientos aleatorios de practicas
      10.times do |i|
        practica = user.user_practicas[1 + rand(practicas_length)]
        practica.insert_at(1 + rand(practicas_length))
      end
    end
  end

end
