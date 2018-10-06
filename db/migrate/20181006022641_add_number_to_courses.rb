class AddNumberToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :number, :string
  end
end
