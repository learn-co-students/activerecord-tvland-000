class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
	  t.string :name
	  t.string :catchphrase
	  t.belongs_to :actor, index: true
	  t.belongs_to :show, index: true
	end
  end
end