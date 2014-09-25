class Anhousehold < ActiveRecord::Base
  before_save :total

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      # column headers for table - language
      column_header = [ "number_district","danalog","darea_building","darea_land","dvalue_proposition_usd",
                        "dvalue_proposition_usd_no_land","dvalue_proposition_usd_kvm","dcategory_repair",
                        "dsource_information","zanalog","zarea","zpurpose","zvalue_proposition_usd",
                        "zsource_information","zvalue_proposition_usd_kvm"]
      csv << column_names
      # column headers for table - language
      csv << column_header
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    @array_error = Array.new([])
    allowed_attributes = [ "number_district","danalog","darea_building","darea_land","dvalue_proposition_usd",
                           "dvalue_proposition_usd_no_land","dvalue_proposition_usd_kvm","dcategory_repair",
                           "dsource_information","zanalog","zarea","zpurpose","zvalue_proposition_usd",
                           "zsource_information","zvalue_proposition_usd_kvm"]
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    header = [ "number_district","danalog","darea_building","darea_land","dvalue_proposition_usd",
               "dvalue_proposition_usd_no_land","dvalue_proposition_usd_kvm","dcategory_repair",
               "dsource_information","zanalog","zarea","zpurpose","zvalue_proposition_usd",
               "zsource_information","zvalue_proposition_usd_kvm"]
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = find_by_id(row["number_district"]) || new
      product.attributes = row.to_hash.select { |k,v| allowed_attributes.include? k }
      #product.save!
      if product.valid?
        product.save!
      else
        @array_error.push(row["number_district"])
      end
    end
  end


  def self.check_import_errors
    if @array_error.blank?
      true
    else
      false
      @array_error
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
      when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
      when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def total
    self.dvalue_proposition_usd_no_land = dvalue_proposition_usd - darea_land * mediana
    self.dvalue_proposition_usd_kvm = dvalue_proposition_usd_no_land / darea_building

  end
end
