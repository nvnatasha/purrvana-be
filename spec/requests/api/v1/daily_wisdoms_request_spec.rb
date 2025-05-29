require 'rails_helper'

RSpec.describe 'wisdoms API', type: :request do
    before :each do
        host! "localhost"
    
        @wisdom1 = DailyWisdom.create!(quote: "Nap like no one's watching.")
        @wisdom2 = DailyWisdom.create!(quote: "Stretch your soul and your paws.")
      end
    
      it 'returns all daily wisdoms' do
        get '/api/v1/daily_wisdom'
    
        expect(response).to be_successful
        expect(response.status).to eq(200)
    
        json = JSON.parse(response.body, symbolize_names: true)[:data]
    
        expect(json).to be_an(Array)
        expect(json.count).to eq(2)
    
        json.each do |wisdom|
          expect(wisdom).to have_key(:id)
          expect(wisdom[:attributes]).to have_key(:quote)
        end
      end
    
      it 'returns a single daily wisdom' do
        get "/api/v1/daily_wisdom/#{@wisdom1.id}"
    
        expect(response).to be_successful
        expect(response.status).to eq(200)
    
        json = JSON.parse(response.body, symbolize_names: true)[:data]
    
        expect(json).to be_a(Hash)
        expect(json[:id]).to eq(@wisdom1.id.to_s)
        expect(json[:attributes][:quote]).to eq(@wisdom1.quote)
      end
end