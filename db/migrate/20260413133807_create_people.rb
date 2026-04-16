class CreatePeople < ActiveRecord::Migration[8.1]
  def change
    create_table :people do |t|
      t.string :name
      t.text :bio, optional: true
      t.date :birth_date, optional: true

      t.timestamps
    end
  end
end
