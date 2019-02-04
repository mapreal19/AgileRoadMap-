FactoryBot.define do
  factory :user do
    ambito_trabajo
    sector_empresa

    name { 'mario' }
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password { 'password' }
    miembros_equipo { 3 }
  end
end
