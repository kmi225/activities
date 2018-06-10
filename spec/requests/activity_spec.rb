require 'rails_helper'

RSpec.describe 'Activities API', type: :request do
  # initialize test data 
 # let!(:activities) { create_list(:activity, 10) }
 # let(:activity_id) { activities.first.id }

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

=begin  
  # Test suite for GET /activity/:id
  describe 'GET /activity/:id' do
    before { get "/activity/#{activity_id}" }

    context 'when the record exists' do
      it 'returns the activity' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(activity_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:activity_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end
  end

=begin 
  # Test suite for POST /todos
  describe 'POST /activity' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }

    context 'when the request is valid' do
      before { post '/activity', params: valid_attributes }

      it 'creates a activity' do
        expect(json['name']).to eq('Sigiriya')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/activity', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end
=end
end