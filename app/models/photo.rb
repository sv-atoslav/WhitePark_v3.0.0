class Photo < ApplicationRecord
	has_attached_file :avatar, default_url: "lost.jpg"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
