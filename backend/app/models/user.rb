class User < ApplicationRecord
    has_many :tasks,dependent: :destroy
    has_many :projects,dependent: :destroy

    attr_accessor :remember_token
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

    #ハッシュ値の生成
    def User.digest(string)
        
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    #パスワードトークンを生成する
    def User.new_token
       SecureRandom.urlsafe_base64
    end

    #永続的セッションのためにパスワードトークンとトークンのハッシュ値をDBに保存する
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest,User.digest(remember_token))
    end

    # 渡されたトークンがダイジェストと一致したらtrueを返す
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    #ログイン状態を破棄する
    def forget
        update_attribute(:remember_digest, nil)
    end
end
