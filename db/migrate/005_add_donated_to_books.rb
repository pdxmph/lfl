class AddDonatedToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :donated, :boolean, :default => 0
  end

  def self.down
    remove_column :books, :donated
  end
end
