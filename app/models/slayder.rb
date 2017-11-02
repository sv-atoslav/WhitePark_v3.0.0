class Slayder < ApplicationRecord
	def self.title_action_converter(title, ru_to_en)
		# correct when title is string, ru_to_en is bool
		if ru_to_en
			case title
			when "кухня"
				return "kitchen"
			when "главная"
				return "main"
			else
				return "not found"
			end
		else
			case title
			when "kitchen"
				return "кухня"
			when "main"
				return "главная"
			else
				return "not found"
			end
		end
		#dont forgot GuestController !
	end
end
