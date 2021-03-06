class Photo < ApplicationRecord
	mount_uploader :avatar, AvatarUploader

	def self.try_get_way_to_img_tag_by_id(one_photo_id)
		one_photo = Photo.find_by(id: one_photo_id)
		return try_get_way_to_img_tag_by_photo(one_photo)
	end
	
	def self.try_get_way_to_img_tag_by_photo(one_photo)
		if (one_photo.nil? || !one_photo.avatar || one_photo.avatar.blank?) 
			return "lost.jpg" # WAY_TO_APP/assets/images/lost.jpg need be exist
		else 
			return one_photo.avatar.url.to_s
		end
	end
end
