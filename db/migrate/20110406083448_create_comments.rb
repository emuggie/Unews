class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :user_id, :default=>0, :not_null=>true
      t.string :user_name, :default=>'anonymous',:not_null=>true,:limit=>20
      t.string :user_photo_url, :default=>''
      t.string :comment, :default=>'', :not_null=>true,:limit=>120
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
