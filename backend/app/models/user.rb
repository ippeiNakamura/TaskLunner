class User < ApplicationRecord
    has_many :tasks,dependent: :destroy
    has_many :projects,dependent: :destroy
    #has_secure_password
    validates :name, uniqueness: true,presence: true,length: {maximum: 50 ,message:"%{count}文字以内で入力してください"}
    validates :password, presence: true
end
