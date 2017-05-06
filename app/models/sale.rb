class Sale < ApplicationRecord

  belongs_to :product

  validates :trading_date,
            :revenue,
            presence: true

end