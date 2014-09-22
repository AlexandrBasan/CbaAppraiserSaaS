class CreateRepairs < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.integer :high
      t.integer :eurorepair
      t.integer :advanced
      t.integer :simple

      t.timestamps
    end
  end
end
