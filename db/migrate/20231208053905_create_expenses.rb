class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.string :title
      t.decimal :amount
      t.date :date

      t.timestamps
    end
  end
end
