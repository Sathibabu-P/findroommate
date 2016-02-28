class Picture < ActiveRecord::Base
  belongs_to :room
  has_attached_file :attachment, styles: { medium: "800x800>", thumb: "180x180>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\Z/
end
