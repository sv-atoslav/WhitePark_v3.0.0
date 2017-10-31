class Opinion < ApplicationRecord
	def self.CreateByGuest(author, email, phone, visit, words)
		o_n = Opinion.new
		o_n.author = author
		o_n.email  =  email
		o_n.phone  =  phone
		o_n.visit  =  visit
		o_n.words  =  words
        WpMailer.say_about_new_opinion(o_n).deliver_now
		o_n.save
	end
end
