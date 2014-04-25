namespace :db do
  desc "Create fake users"
  task fake_users: :environment do

    # Borramos si ya han sido creados. Destroy para activar callbacks
    # User.all.where("email LIKE ? ", 'yopolt-%@faker.com')
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
      6.times do
        objetivo = user.user_objetivos[rand(objetivos_length)]
        objetivo.insert_at(1 + rand(objetivos_length))
      end

      # 10 ordenamientos aleatorios de practicas
      10.times do
        practica = user.user_practicas[rand(practicas_length)]
        practica.insert_at(1 + rand(practicas_length))
      end
    end
  end

  desc "Create fake info for fake users"
  task fake_users_generate_info_pracs: :environment do
    User.where("email LIKE ? ", 'yopolt-%@faker.com').each do |user|
      user.user_practicas.each do |user_prac|
        # MARGEN = { -1 => 'No definido', 0 => 'Ninguno', 1 => 'Poco', 2 => 'Medio', 3 => 'Alto'}
        user_prac.range = rand(5) - 1
        # Cambiamos practica a no aplicable en el 20% de los casos
        user_prac.toggle!(:no_aplicable) if rand > 0.8
        user_prac.save!
      end
    end

  end
end
