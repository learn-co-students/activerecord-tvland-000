class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, :through => :characters

  def full_name
    fn = self.first_name
    ln = self.last_name
    return "#{fn} #{ln}"
  end

  def list_roles
    arr = []
    self.characters.each do |character|
      arr << "#{character.name} - #{character.show.name}"
    end
    return arr
  end
end
