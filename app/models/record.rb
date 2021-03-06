require "csv"

class Record < ActiveRecord::Base
  def self.check_dupes(csv_data, col_num = 0, field = "email", inc_dupes = true)
    non_dupes = []
    CSV.foreach(csv_data.path) do |row|
      r = Record.send("find_by_#{field}", row[col_num.to_i])
      if inc_dupes
        r ? non_dupes << (row << r.email_status) : non_dupes << row
      else
        non_dupes << row if r.nil?
      end
    end
    non_dupes
  end

  def self.import_new(csv_data)
    CSV.foreach(csv_data.path) do |row|
      Record.create!({
        orgname: row[1],
        email: row[0],
        date: Chronic.parse(row[2]),
        status: row[3],
        email_status: row[4],
        secondary_status: row[5],
        firstname: row[6],
        lastname: row[7],
        blacklist: row[8]
      })
    end
  end

  def self.get_attributes
    Record.new.attributes.keys
  end
end
