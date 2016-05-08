class CreateDirector < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.string :name
      t.date :birthdate
    end
  end
end
