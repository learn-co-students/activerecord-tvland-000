class AddShowToCharacter < ActiveRecord::Migration
    def change
        add_column :characters, :show_id, :integer
    end
end