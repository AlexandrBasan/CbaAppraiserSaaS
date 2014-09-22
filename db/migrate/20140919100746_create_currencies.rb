class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.decimal :value
      t.string :symbol

      t.timestamps
    end
  end
end
