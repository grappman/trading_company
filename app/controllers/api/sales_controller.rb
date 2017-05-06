class Api::SalesController < InheritedResources::Base

  def index
    unless (params[:from] && params[:to]) && (Date.parse(params[:from]) <= Date.parse(params[:to]))
      return render(json: "Invalid date params", status: 422 )
    end

    from_at = Date.parse(params[:from])
    to_at = Date.parse(params[:to])

    @sales = Sale.where(trading_date: from_at .. to_at)
    goods = Product.all.map { |p| { name: p.name, revenue: @sales.where(product_id: p.id).sum(:revenue) }}
    index! do |success, failure|
      success.json do
        render  json: {
            from: from_at,
            to: to_at,
            goods: goods,
            total_revenue: @sales.sum(:revenue)
        }
      end
    end
  end

end