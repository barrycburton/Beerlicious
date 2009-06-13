class AddKindToStore < ActiveRecord::Migration
  def self.up
    add_column :stores, :kind, :string
  end

  def self.down
    remove_column :stores, :kind
  end
end
