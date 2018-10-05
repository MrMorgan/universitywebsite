class AddRoomNumberToSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :room_number, :string
  end
end
