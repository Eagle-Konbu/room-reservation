class ChangeNullOptionUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :name, false
    change_column_null :users, :is_admin, false
  end
end
