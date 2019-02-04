FactoryBot.define do
  factory :user_practica do
    user

    sequence :name_es do |n|
      "practica#{n}"
    end
    sequence :name_en do |n|
      "practica#{n}"
    end
    comment { 'some comment' }
    effort { 2 }
    range { 0 }
    position { 1 }
  end
end
