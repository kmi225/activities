require 'rails_helper'

RSpec.describe 'Activities API', type: :request do
  # initialize test data 
  let!(:activities) { create_list(:activity, 10) }
  let(:id) { "001" }

  # Test suite for GET /todos
  describe 'GET /activity' do
    # make HTTP get request before each example
    before { get '/activity' }

    it 'returns activities' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for POST /todos
  describe 'POST /activity' do
    # valid payload
    let(:valid_attributes) { { name: 'Sigiriya' } }

    context 'when the request is valid' do
      before { post '/activity', params: valid_attributes }

      it 'creates a activity' do
        expect(json['name']).to eq('Sigiriya')
        #expect(json['activity_id']).to eq('1')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/activity' }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for GET /activity/:id
  describe 'GET /activity/:id' do
    before { get "/activity/#{id}" }

    context 'when the record exists' do
      it 'returns the activity' do
        expect(json).not_to be_empty
        #expect(json['activity_id']).to eq(activity_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'error' do
      let(:id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Activity/)
      end
    end   
  end

  # Test suite for PUT /todos/:id
  describe 'PUT /activity/:id' do
    let(:valid_attributes) { { name: 'Shopping' } }

    context 'when the record exists' do
      before { put "/activity/#{id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end