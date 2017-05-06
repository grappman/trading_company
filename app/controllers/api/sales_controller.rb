class Api::SalesController < Api::ApplicationController

  def index
    # from_at = Date.parse(params[:from])
    # to = Date.parse(params[:to])
    #
    # return render(json: "Invalid date params", status: 422 ) if from_at > to
    #
    # @sales = @sales.where(created_at: from_at .. to)

    index! do |success, failure|
      success.json do
        render  json: @sales, serializer: SalesSerializer
      end
    end
  end

  # private
  #
  #   def sales_params
  #     params.require(:sale).permit(:from, :to)
  #   end

end