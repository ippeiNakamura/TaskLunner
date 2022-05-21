FactoryBot.define do
  factory :user do
    name { '田中　太郎' }
    email { 'taro@outlook.co.jp' }
    password { 'taro12345' }
    password_confirmation { 'taro12345' }
  end
end
