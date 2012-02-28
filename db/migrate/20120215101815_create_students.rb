class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :user
      t.string :password
      t.string :role
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :college

      t.timestamps
    end
  end
end
