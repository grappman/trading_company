class SalesSerializer < ActiveModel::Serializer

  include Rails.application.routes.url_helpers

  attributes :title, :revenue, :total_revenue

  def total_revenue; end

end