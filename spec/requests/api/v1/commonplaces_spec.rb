# spec/requests/commonplaces_spec.rb
require 'rails_helper'

RSpec.describe 'Commonplaces API', type: :request do
  # initialize test data
  let!(:commonplaces) { create_list(:commonplace, 10) }
  let(:commonplace_id) { commonplaces.first.id }

  # Test suite for GET /commonplaces
  describe 'GET /api/v1/commonplaces' do
    # make HTTP get request before each example
    before { get '/api/v1/commonplaces', params: { format: :json } }

    it 'returns commonplaces as JSON' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # # Test suite for POST /commonplaces
  # describe 'POST /commonplaces' do
  #   # valid payload
  #   let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }

  #   context 'when the request is valid' do
  #     before { post '/commonplaces', params: valid_attributes }

  #     it 'creates a commonplace' do
  #       expect(json['title']).to eq('Learn Elm')
  #     end

  #     it 'returns status code 201' do
  #       expect(response).to have_http_status(201)
  #     end
  #   end

  #   context 'when the request is invalid' do
  #     before { post '/commonplaces', params: { title: 'Foobar' } }

  #     it 'returns status code 422' do
  #       expect(response).to have_http_status(422)
  #     end

  #     it 'returns a validation failure message' do
  #       expect(response.body)
  #         .to match(/Validation failed: Created by can't be blank/)
  #     end
  #   end
  # end

  # # Test suite for PUT /commonplaces/:id
  # describe 'PUT /commonplaces/:id' do
  #   let(:valid_attributes) { { title: 'Shopping' } }

  #   context 'when the record exists' do
  #     before { put "/commonplaces/#{commonplace_id}", params: valid_attributes }

  #     it 'updates the record' do
  #       expect(response.body).to be_empty
  #     end

  #     it 'returns status code 204' do
  #       expect(response).to have_http_status(204)
  #     end
  #   end
  # end

  # # Test suite for DELETE /commonplaces/:id
  # describe 'DELETE /commonplaces/:id' do
  #   before { delete "/commonplaces/#{commonplace_id}" }

  #   it 'returns status code 204' do
  #     expect(response).to have_http_status(204)
  #   end
  # end
end
