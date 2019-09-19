module Api
  module V1
    class CommonplacesController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        @commonplaces = Commonplace.all.order(:created_at).reverse
        render json: @commonplaces
      end

      def create
        commonplace = Commonplace.new(permitted_params)
        render json: commonplace if commonplace.save
      end

      def destroy
        Commonplace.destroy(params[:id])
      end

      def update
        commonplace = Commonplace.find(params[:id])
        commonplace.published_at = Time.now if params[:publish]
        commonplace.update_attributes(permitted_params)
        render json: commonplace
      end

      private

      def permitted_params
        params.require(:commonplace).permit(:quote, :url, :source, :notes, :publish)
      end
    end
  end
end
