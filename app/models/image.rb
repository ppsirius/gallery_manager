class Image < ActiveRecord::Base
  has_attached_file :photo,  
                    :styles => { :large => '1920x1200', :medium => "800x600>", :thumb => "200x200>" },
                    :unless => Proc.new { |imports| imports.photo_file_name.blank? }
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg"]
end




