module Api
  module V1
    class CommonplacesController < ApplicationController
      def index
        @commonplaces = Commonplace.all
        render json: @commonplaces
      end
    end
  end
end
