class CreateAnearts < ActiveRecord::Migration
  def change
    create_table :anearts do |t|
      t.integer :district_number
      t.string :analogs_address
      t.decimal :area
      t.string :purpose
      t.decimal :value_proposition_usd
      t.string :information_source
      t.decimal :value_proposition_usdone

      t.timestamps
    end
  end
end
