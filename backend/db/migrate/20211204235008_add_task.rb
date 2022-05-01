class AddTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :assumptionCostTime, :time
  end
end
