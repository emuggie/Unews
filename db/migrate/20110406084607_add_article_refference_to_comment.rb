class AddArticleRefferenceToComment < ActiveRecord::Migration
  def self.up
    add_column :comments, :article_id, :integer, :not_null=>true
  end

  def self.down
  end
end
