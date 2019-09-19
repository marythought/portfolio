module Api
  module V1
    class CommonplacesController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        @commonplaces = Commonplace.published.order(:created_at).reverse
        render json: @commonplaces
      end

      def create
        commonplace = Commonplace.new(permitted_params.slice(:quote, :url, :source, :notes))
        commonplace.published_at = Time.now if publish
        render json: commonplace if commonplace.save
      end

      def destroy
        Commonplace.destroy(params[:id])
      end

      def update
        commonplace = Commonplace.find(params[:id])
        commonplace.published_at = Time.now if publish
        commonplace.update_attributes(permitted_params.slice(:quote, :url, :source, :notes))
        render json: commonplace
      end

      private

      def permitted_params
        params.require(:commonplace).permit(:id, :quote, :url, :source, :notes, :publish)
      end

      def publish
        permitted_params[:publish]
      end
    end
  end
end
