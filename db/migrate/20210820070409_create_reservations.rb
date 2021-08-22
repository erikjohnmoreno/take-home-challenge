class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :guest, null: false, foreign_key: true
      t.string :start_date
      t.string :end_date
      t.integer :nights
      t.json :guests
      t.string :status
      t.string :currency
      t.string :payout_price
      t.string :security_price
      t.string :total_price
      t.timestamps
    end
  end
end
