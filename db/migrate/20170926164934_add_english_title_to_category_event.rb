class AddEnglishTitleToCategoryEvent < ActiveRecord::Migration[5.1]
	def change
		change_table :category_events do |t|
			t.string :eng_title
			t.rename :title, :ru_title
		end
	end
end
