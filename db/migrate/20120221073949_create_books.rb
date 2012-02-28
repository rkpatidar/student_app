class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :book_name
      t.string :author
      t.string :edition
      t.string :publisher

      t.timestamps
    end
  end
end
