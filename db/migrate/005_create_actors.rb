class CreateActors < ActiveRecord::Migration

  def change
    create_table :actors do |t|
      t.string :first_name
      t.string :last_name
      t.belongs_to :show, index: true
    end
  end

end