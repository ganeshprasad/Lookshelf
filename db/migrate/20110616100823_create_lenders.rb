class CreateLenders < ActiveRecord::Migration
  def self.up
    create_table :lenders do |t|
      t.integer :lender_id
      t.integer :borrower_id
      t.string :status
      t.integer :tag_id
      t.date :date_of_request
      t.date :estimated_delivery
      t.date :return_date

      t.timestamps
    end
  end

  def self.down
    drop_table :lenders
  end
end
