class User < ApplicationRecord
    has_many :tasks,dependent: :destroy
    has_many :projects,dependent: :destroy

    validates :name, presence: true,length: {maximum: 50 ,message:"%{count}文字以内で入力してください"}
    has_secure_password

end
