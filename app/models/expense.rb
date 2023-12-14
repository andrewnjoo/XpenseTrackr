class Expense < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :amount, presence: true, numericality: { message: "must be a valid number" }
end
