require "csv"

class Record < ActiveRecord::Base
  def self.check_dupes(csv_data, col_num = 0, field = "email")
    non_dupes = []

    CSV.foreach(csv_data.path) do |row|
      r = Record.send("find_by_#{field}", row[col_num.to_i])
      non_dupes << row if r.nil?
    end

    non_dupes
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

  def self.get_attributes
    Record.new.attributes.keys
  end
end
