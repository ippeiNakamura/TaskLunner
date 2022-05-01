class ChangeColumnTask < ActiveRecord::Migration[6.1]
  def change
    rename_column :tasks, :assumptionCostTime, :assumptionCostTimeFomrat
    change_column :tasks, :assumptionCostTimeFomrat, :string
    
  end
end
