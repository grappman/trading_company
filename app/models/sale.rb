class Sale < ApplicationRecord

  belongs_to :product

  validates :trading_date,
            :revenue,
            :product_id,
            presence: true

  validates :trading_date,
            uniqueness: { scope: :product_id }
end