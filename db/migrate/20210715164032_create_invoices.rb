class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.string :no
      t.date :date_create
      t.date :supply
      t.string :comment

      t.timestamps
    end
  end
end
