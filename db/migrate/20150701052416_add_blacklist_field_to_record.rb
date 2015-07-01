class AddBlacklistFieldToRecord < ActiveRecord::Migration
  def change
    add_column :records, :blacklist, :string
  end
end
