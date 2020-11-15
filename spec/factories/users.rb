FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { '111aaa' }
    password_confirmation { password }
    first_name            { '加藤' }
    family_name           { '弘樹' }
    first_name_kana       { 'カトウ' }
    family_name_kana      { 'ヒロキ' }
    birth_day             { '2000-01-01' }
  end
end
