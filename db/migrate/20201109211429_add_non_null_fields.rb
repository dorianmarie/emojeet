class AddNonNullFields < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :name, false
    change_column_null :users, :password_digest, false
    change_column_null :messages, :user_id, false
  end
end
