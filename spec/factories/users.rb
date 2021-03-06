FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    email { Faker::Internet.free_email }
    password { "a1#{Faker::Internet.password(min_length: 6)}" }
    password_confirmation { password }
    nickname { Faker::Name.name }
    last_name { person.last.kanji }
    first_name { person.first.kanji }
    last_name_kana { person.last.katakana }
    first_name_kana { person.first.katakana }
    birth_date { Faker::Date.birthday($format = 'Y-m-d', $max = 'now') }
  end
end
