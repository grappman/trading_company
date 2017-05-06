class Sale < ApplicationRecord

  attr_accessor :from, :to

  validate :from_more_than_to?,
           if: 'from > to'

  validate :to_less_than_from?,
           if: 'to < from'

  validates :title,
            :revenue,
            presence: true

  def from_more_than_to?
    errors.add(:from, "Incorrect. 'From' more than 'to'")
  end

  def to_less_than_from?
    errors.add(:to, "Incorrect. 'To' less than 'from'")
  end

end