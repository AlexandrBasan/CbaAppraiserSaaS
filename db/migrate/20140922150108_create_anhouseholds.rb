class CreateAnhouseholds < ActiveRecord::Migration
  def change
    create_table :anhouseholds do |t|
      t.integer :number_district
      t.string :danalog
      t.decimal :darea_building
      t.decimal :darea_land
      t.decimal :dvalue_proposition_usd
      t.decimal :dvalue_proposition_usd_no_land
      t.decimal :dvalue_proposition_usd_kvm
      t.string :dcategory_repair
      t.string :dsource_information
      t.string :zanalog
      t.decimal :zarea
      t.string :zpurpose
      t.decimal :zvalue_proposition_usd
      t.string :zsource_information
      t.decimal :zvalue_proposition_usd_kvm
      t.integer :mediana

      t.timestamps
    end
  end
end
