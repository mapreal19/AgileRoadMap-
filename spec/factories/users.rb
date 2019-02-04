FactoryBot.define do
  factory :user do
    ambito_trabajo_id { AmbitoTrabajo.first.id }
    sector_empresa_id { SectorEmpresa.first.id }

    name { 'mario' }
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password { 'password' }
    miembros_equipo { 3 }
  end
end
