class AddUserToDisaster < ActiveRecord::Migration[5.2]
  def change
    add_reference :disasters, :user, foreign_key: true
  end
end
