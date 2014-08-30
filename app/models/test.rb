class Test < ActiveRecord::Base

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    allowed_attributes = [ "id","col_1_s","col_2_i","created_at","updated_at"]
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = find_by_id(row["id"]) || new
      product.attributes = row.to_hash.select { |k,v| allowed_attributes.include? k }
      product.save!
    end
  end
  # import csv
  def self.import(file)
    # Check user team
    check_relationship = Relationship.where(followed_id: User.find(User.current)).take
    if check_relationship.nil?
      user_in_team = User.current
    else
      user_in_team = User.find_by_id(check_relationship.follower_id)
    end
    delivery_company_id = DeliveryCompany.where(user_id: [User.current, user_in_team]).take.id
    @array_error = Array.new([])
    # import rates
    CSV.foreach(file.path, headers: true) do |row|
      #product = find_by_id(row["id"]) || new

      product = new
      row["id"] = nil
      row["delivery_company_id"] = delivery_company_id
      row["created_at"] = nil
      row["updated_at"] = nil
      # geocode google maps
      #row["start_address"] = nil
      #row["end_address"] = nil
      #row["start_country"] = nil
      #row["start_city"] = nil
      #row["start_state"] = nil
      #row["end_country"] = nil
      #row["end_city"] = nil
      #row["end_state"] = nil
      product.attributes = row.to_hash
      if product.valid?
        product.save!
      else
        @array_error.push(product)
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
      when ".csv" then Roo::Csv.new(file.path)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
