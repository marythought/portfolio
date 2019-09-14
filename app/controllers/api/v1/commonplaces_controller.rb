module Api
  module V1
    class CommonplacesController < ApplicationController
      protect_from_forgery with: :null_session
      before_action :permitted_params, only: :create

      def index
        @commonplaces = Commonplace.all.order(:created_at).reverse
        render json: @commonplaces
      end

      def create
        @commonplace = Commonplace.new(@params)
        render json: Commonplace.all.order(:created_at).reverse if @commonplace.save
      end

      private

      def permitted_params
        @params = params.require(:commonplace).permit(:quote, :url, :source, :notes)
      end
    end
  end
end
