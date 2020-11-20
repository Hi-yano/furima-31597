FactoryBot.define do
  factory :user do
    nickname              { 'たろう' } # {Faker::Name.initials(number: 2)}
    email                 { 'test@abe.com' } # {Faker::Internet.free_email}
    # password = Faker::Internet.password(min_length: 6, mix_case: true)
    password              { '123abc' } # {password}
    password_confirmation { '123abc' } # {password}
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'カタカナ' }
    first_name_kana       { 'カタカナ' }
    date_of_birth         { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end