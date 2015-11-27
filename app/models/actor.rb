class Actor < ActiveRecord::Base
  
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{first_name} #{last_name}"
  end

  def list_roles
    self.characters.map{|character_info|
      "#{character_info.name} - #{character_info.show.name}"
    }.first
  end

end