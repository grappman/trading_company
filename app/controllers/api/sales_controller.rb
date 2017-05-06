class Api::SalesController < Api::ApplicationController

  def index
    index! do |success, failure|
      success.json do
        render  json: @sales, serializer: SalesSerializer
      end
    end
  end

  private

    def sales_params
      params.require(:sale).permit(:from, :to)
    end

end