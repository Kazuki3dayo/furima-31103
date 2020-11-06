FactoryBot.define do
  factory :user do
    nickname              {"楽天太郎"}
    email                 {"raku@ten"}
    password              {"abc123"}
    # password              {password}
    password_confirmation {"abc123"}
    last_name             {"楽天"}
    first_name            {"太郎"}
    last_name_kana        {"ラクテン"}
    first_name_kana       {"タロウ"}
    birth_day             {Faker::Date.birthday}
  end
end