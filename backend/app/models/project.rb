class Project < ApplicationRecord
    belongs_to :user,optional: true
    has_many :work_targets,dependent: :destroy
    validates :name,uniqueness: {scope: :user_id,message: "プロジェクト名は既に存在します"},presence: true
    scope :set_projects, -> { where(:attibute => value)}
    # Ex:- scope :active, -> {where(:active => true)}
end
