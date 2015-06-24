class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :orgname
      t.string :firstname
      t.string :lastname
      t.string :email
      t.datetime :date
      t.string :status
      t.string :email_status
      t.string :secondary_status

      t.timestamps null: false
    end
  end
end
