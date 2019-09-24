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

  # Test suite for POST /commonplaces
  describe 'POST /commonplaces' do
    # valid payload
    let(:valid_attributes) do
      {
        commonplace: {
          quote: 'Learn Elm',
          notes: 'looks cool',
          url: 'http://www.example.com',
          source: 'Wash Post',
          publish: true
        }
      }
    end

    context 'when the request is valid' do
      before { post '/api/v1/commonplaces', params: valid_attributes }

      it 'creates a commonplace' do
        expect(json['quote']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/commonplaces', params: { commonplace: { quote: '' } } }

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end
    end
  end

  # Test suite for PUT /commonplaces/:id
  describe 'PUT /commonplaces/:id' do
    let(:valid_attributes) do
      {
        commonplace: {
          id: commonplace_id,
          quote: 'Learn Rails',
          notes: 'looks cool',
          url: 'http://www.example.com',
          source: 'Wash Post',
          publish: true
        }
      }
    end

    context 'when the record exists' do
      before { put "/api/v1/commonplaces/#{commonplace_id}", params: valid_attributes }

      it 'updates the record' do
        expect(json['quote']).to eq('Learn Rails')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when no record exists' do
      before { put "/api/v1/commonplaces/#{commonplace_id + 100}", params: valid_attributes }

      it 'returns 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  # Test suite for DELETE /commonplaces/:id
  describe 'DELETE /commonplaces/:id' do
    before { delete "/api/v1/commonplaces/#{commonplace_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

    context 'when no record exists' do
      before { delete "/api/v1/commonplaces/#{commonplace_id + 100}" }

      it 'returns 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
