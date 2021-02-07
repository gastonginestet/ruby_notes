class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.string :body
      t.belongs_to :book, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
    add_index :notes, %i[book_id title], unique: true

  end
end
