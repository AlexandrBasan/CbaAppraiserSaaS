class ChangeSourceTypeInAnhouseholds < ActiveRecord::Migration
  def change
    change_column :anhouseholds, :dsource_information, :text
    change_column :anhouseholds, :zsource_information, :text
  end
end
