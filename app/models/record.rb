require "csv"

class Record < ActiveRecord::Base
  def self.check_dupes(csv_data)
    CSV.foreach(csv_data.path) do |row|

    end 
  end

  def self.import_new(csv_data)
    CSV.foreach(csv_data.path) do |row|
      Record.create!({
        orgname: row[0],
        email: row[1],
        date: Chronic.parse(row[2]),
        status: row[3],
        email_status: row[4],
        secondary_status: row[5],
        firstname: "harry",
        lastname: "sally"
      })
    end
  end
end
