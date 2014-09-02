class AddCol3RuToTests < ActiveRecord::Migration
  def change
    add_column :tests, :col_3_ru, :string
  end
end
