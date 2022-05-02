class User < ApplicationRecord
    has_many :tasks,dependent: :destroy
    has_many :projects,dependent: :destroy

    validates :name, presence: true,
                     length: {maximum: 50 ,message:"50文字以内で入力してください"}

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: {maximum: 255 ,message: "255文字以内で入力してください" },
                      format: { with: VALID_EMAIL_REGEX }

    validates :password, presence: true,
                         length: { minimum:6,message: "6文字以上で入力してください" }
    
    has_secure_password

end
