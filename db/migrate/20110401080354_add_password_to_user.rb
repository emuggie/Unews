class AddPasswordToUser < ActiveRecord::Migration
  def self.up
	  add_column :users, :password, :string, :limit => 20, :not_null => true, :default => 0000
  end

  def self.down
  end
end
