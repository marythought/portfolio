module Api
  module V1
    class CommonplacesController < ApplicationController
      def index
        render json: { commonplaces: [
          {
            author: 'William Shakespeare',
            notes: 'Love this line',
            quote: 'To be or not to be, that is the question',
            url: 'http://shakespeare.mit.edu/hamlet/full.html',
          }
        ] }.to_json
      end
    end
  end
end
