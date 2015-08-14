class Actor < ActiveRecord::Base
	has_many :characters
	has_many :shows, through: :characters

	def full_name
		"#{self.first_name} #{self.last_name}"
	end

	def list_roles
		list = ""
		self.shows.each do |show|
			list<<"#{self.characters.find_by(show_id: show.id).name} - #{show.name}" + "\n"
		end
		list
	end

end