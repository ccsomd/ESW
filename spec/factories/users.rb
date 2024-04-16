require 'faker'

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    name { "#{first_name} #{last_name}" }
    email { Faker::Internet.email(name: name, separators: [ '+' ], domain: 'example.com') }
    provider { Faker::Alphanumeric.alpha(number: 5) }
    uid { Faker::Internet.uuid }
    badge { Faker::Number.between(from: 700, to: 19999) }
    roles { 'user' }
    encrypted_password { Faker::Internet.password() }
  end
end
