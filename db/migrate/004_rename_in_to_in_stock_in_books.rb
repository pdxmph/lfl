class RenameInToInStockInBooks < ActiveRecord::Migration
  def self.up
    rename_column :books, :in, :in_stock
  end

  def self.down
    rename_column :books, :in_stock, :in
  end
end
