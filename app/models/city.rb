class City < ActiveRecord::Base


	has_many :areas
	has_many :rooms
	validates :name, presence: true, uniqueness: true


	def self.import(file)
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    city = find_by_id(row["id"]) || new
	    city.attributes = row.to_hash.slice(*row.to_hash.keys)
	    city.save!
	  end
	end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
	  when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
	   when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
	   when '.xlsx' then Roo::Excelx.new(file.path,options={})
	   else raise "Unknown file type: #{file.original_filename}"
	  end
	end


end
