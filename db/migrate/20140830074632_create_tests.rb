class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :col_1_s
      t.integer :col_2_i

      t.timestamps
    end
  end
end
