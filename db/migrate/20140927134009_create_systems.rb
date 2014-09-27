class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :torg_apartment
      t.string :torg_earth
      t.string :torg_house
      t.string :floor_apartment

      t.timestamps
    end
  end
end
