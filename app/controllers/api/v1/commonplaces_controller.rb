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
            url: c.url,
            created_at: c.created_at,
            publishedAt: c.published_at,
            categories: c.category_names
          }
        end
        render json: @commonplaces, status: :ok
      end

      def create
        commonplace = Commonplace.new(permitted_params.slice(:quote, :url, :source, :notes))
        commonplace.published_at = Time.now if publish
        add_categories(commonplace)
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
        update_categories(commonplace)
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
        params.require(:commonplace).permit(:id, :quote, :url, :source, :notes, :publish, :categories)
      end

      def publish
        permitted_params[:publish]
      end

      def add_categories(commonplace)
        categories = permitted_params[:categories]&.split(';')
        categories&.each do |name|
          commonplace.add_category(name)
        end
      end

      def update_categories(commonplace)
        categories = permitted_params[:categories]&.split(';')
        commonplace.categories.destroy_all
        categories&.each do |name|
          commonplace.add_category(name)
        end
      end
    end
  end
end
