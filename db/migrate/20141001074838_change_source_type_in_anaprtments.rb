class ChangeSourceTypeInAnaprtments < ActiveRecord::Migration
  def change
    change_column :anaprtments, :source, :text
  end
end
