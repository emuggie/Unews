class AddReadCountInArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :read_count, :integer,:default=>0,:not_null=>true
  end

  def self.down
  end
end
