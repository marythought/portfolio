module Api
  module V1
    class CommonplacesController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        commonplaces = Commonplace.published.includes(:categories).order(:created_at).reverse
        @commonplaces = commonplaces.map do |c|
          {
            id: c.id,
            source: c.source,
            quote: c.quote,
            notes: c.notes,
            createdAt: c.created_at,
            publishedAt: c.published_at,
            categories: c.category_names
          }
        end
        render json: @commonplaces, status: :ok
      end

      def create
        commonplace = Commonplace.new(permitted_params.slice(:quote, :url, :source, :notes))
        commonplace.published_at = Time.now if publish
        if commonplace.save
          render json: commonplace, status: :created
        else
          render json: {}, status: :bad_request
        end
      end

      def destroy
        commonplace = Commonplace.find(params[:id])
        commonplace.categories.each(&:destroy)
        if commonplace.destroy
          render json: {}, status: :no_content
        else
          render json: {}, status: :bad_request
        end
      rescue ActiveRecord::RecordNotFound
        render json: {}, status: :not_found
      end

      def update
        commonplace = Commonplace.find(params[:id])
        commonplace.published_at = Time.now if publish
        commonplace.update_attributes(permitted_params.slice(:quote, :url, :source, :notes))
        if commonplace.save
          render json: commonplace, status: :ok
        else
          render json: {}, status: :bad_request
        end
      rescue ActiveRecord::RecordNotFound
        render json: {}, status: :not_found
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
