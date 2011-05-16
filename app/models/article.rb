class Article < ActiveRecord::Base
attr_accessible :article_photo
has_attached_file :article_photo,
		  :styles => {:thumb => "100x100#", :main => "300x"},
			:url => "/photos/article_photo/:id/:style.:extension",
			:path =>":rails_root/public/photos/article_photo/:id/:style.:extension",
      :default_url => '/images/missing.png'
validates_attachment_size :article_photo, :less_than => 2.megabytes 
validates_attachment_content_type :article_photo, :content_type =>['image/jpg', 'image/jpeg', 'image/gif', 'image/png', 'image/pjpeg'] 

  def thumb_url
    return self.article_photo.url(:thumb)
  end

  def main_url
    return self.article_photo.url(:main)
  end
  
  def font_size
    if self.fake == 0
      return  (Math.sqrt(self.real)+15).to_i
    end

    return (Math.sqrt(self.real/self.fake)+15).to_i
  end

  def alpha
    if self.fake ==0
      return 1
    end

    return (self.real/self.fake)
  end
end
