class CreateIssuedbooks < ActiveRecord::Migration
  def change
    create_table :issuedbooks do |t|
      t.integer :book_id
      t.integer :student_id
      t.date :issued_date
      t.date :submited_date
      t.boolean :is_issued

      t.timestamps
    end
  end
end
