json.array!(@anhouseholds) do |anhousehold|
  json.extract! anhousehold, :id, :number_district, :danalog, :darea_building, :darea_land, :dvalue_proposition_usd, :dvalue_proposition_usd_no_land, :dvalue_proposition_usd_kvm, :dcategory_repair, :dsource_information, :zanalog, :zarea, :zpurpose, :zvalue_proposition_usd, :zsource_information, :zvalue_proposition_usd_kvm
  json.url anhousehold_url(anhousehold, format: :json)
end
