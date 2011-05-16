class AddWriter < ActiveRecord::Migration
  def self.up
    add_column :articles, :writer_name,:string, :limit => 20, :default => "anonymous", :not_null => true 
  end

  def self.down
  end
end
