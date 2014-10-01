class ChangeSourceTypeInAnearts < ActiveRecord::Migration
  def change
    change_column :anearts, :information_source, :text
  end
end
