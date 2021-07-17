class Invoice < ApplicationRecord
  validates :no, presence: true
  validates :date_create, presence: true
  validates :supply, presence: true
end
