FactoryBot.define do
    factory :user do
      name { '田中　太郎' }
      email { 'taro@gmail.com' }
      password { 'taro1234' }
      password_confirmation { 'taro1234' }
    end
end
