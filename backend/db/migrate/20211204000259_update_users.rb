class UpdateUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :releaseDate, :date
  end
end
