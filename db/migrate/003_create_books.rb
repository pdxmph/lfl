class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.integer :library_id
      t.string :title
      t.string :author
      t.date :added
      t.boolean :in
      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
