require 'rails_helper'

RSpec.describe 'sessions API', type: :request do
    before :each do
        host! "localhost"
    
        @user = User.create!(
          name: 'Natasha',
          email: 'natasha@example.com',
          password: 'password'
        )
    
        @cat = Cat.create!(
          name: 'Kylo',
          mood: 'Relaxed',
          purr_style: 'Low rumble',
          img_url: 'https://media.tenor.com/mGC7-NWoVZsAAAAi/siamese-cat.gif'
        )
    
        @session1 = Session.create!(
          user: @user,
          cat: @cat,
          duration_seconds: 300,
          started_at: Time.now - 1.hour,
          ended_at: Time.now - 55.minutes
        )
    
        @session2 = Session.create!(
          user: @user,
          cat: @cat,
          duration_seconds: 180,
          started_at: Time.now - 2.hours,
          ended_at: Time.now - 1.hour + 3.minutes
        )
      end

      it 'returns all sessions' do
        get '/api/v1/sessions'
    
        expect(response).to be_successful
        expect(response.status).to eq(200)
    
        json = JSON.parse(response.body, symbolize_names: true)[:data]
        expect(json.count).to eq(2)
    
        expect(json.first[:attributes]).to include(:duration_seconds, :started_at, :ended_at)
      end

      it 'returns one session by id' do
        get "/api/v1/sessions/#{@session1.id}"
    
        expect(response).to be_successful
        json = JSON.parse(response.body, symbolize_names: true)[:data]
    
        expect(json[:id]).to eq(@session1.id.to_s)
        expect(json[:attributes][:duration_seconds]).to eq(300)
        expect(json[:attributes]).to include(:started_at, :ended_at)
      end

      it 'creates a new session' do
        session_params = {
          user_id: @user.id,
          cat_id: @cat.id,
          duration_seconds: 420,
          started_at: Time.now,
          ended_at: Time.now + 7.minutes
        }
    
        headers = { "CONTENT_TYPE" => "application/json" }
    
        post '/api/v1/sessions', headers: headers, params: JSON.generate(session: session_params)
    
        puts response.status
        puts response.body

        expect(response).to be_successful
        expect(response.status).to eq(201)
    
        created = JSON.parse(response.body, symbolize_names: true)[:data]
        expect(created[:attributes][:duration_seconds]).to eq(420)
        expect(created[:attributes]).to include(:started_at, :ended_at)
      end
end