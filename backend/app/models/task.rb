class Task < ApplicationRecord
    belongs_to :flag,optional: true
    acts_as_nested_set
    validates :name,uniqueness: {scope: :flag_id,message: "タスクは既に存在します"},presence: true,length: {maximum: 50 ,message:"%{count}文字以内で入力してください"}
    before_save :change_assumptioncost_timeformat

    def change_assumptioncost_timeformat #想定工数をhh:mm:ss形式に変換
        #想定工数を秒換算し、hh:mm:ss形式に変換
        if self.assumptionCost
            self.assumptionCostTimeFomrat = Time.at(self.assumptionCost * 60 ** 2).utc.strftime('%X') 
        end
    end

    
    


end
