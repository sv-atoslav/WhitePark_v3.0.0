class AddEnglishTitleToArticles < ActiveRecord::Migration[5.1]
	def change
		change_table :articles do |t|
			t.string :eng_title
			t.rename :title, :ru_title
		end
	end
end
