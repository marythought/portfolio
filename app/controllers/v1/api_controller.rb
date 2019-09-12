module V1
  class ApiController < ApplicationController
    def index
      render json: { things: [
        {
          name: 'some-thing',
          guid: '0415673d-32324-34sdf-214241231234'
        }
      ] }.to_json
    end
  end
end
