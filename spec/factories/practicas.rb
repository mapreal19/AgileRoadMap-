FactoryBot.define do
  factory :practica do
    sequence(:position, 1)
    name_es { 'practica1' }
    name_en { 'practice1' }
    effort { 1 }
    agile_method { 'XP' }
    description_en { 'apply this' }
    description_es { 'aplica esto' }
  end
end
