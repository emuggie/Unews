class DropPerToken < ActiveRecord::Migration
  def self.up
    remove_column :users, :persistence_token
    add_column :users, :persistence_token, :string,:null=>true
  end

  def self.down
  end
end
