require 'rails_helper'

RSpec.describe 'cats API', type: :request do
  before :each do
    host! "localhost"
    Cat.destroy_all

    @DuchessMarie = Cat.create!(
      name: 'Duchess Marie',
      mood: 'Sleepy',
      purr_style: 'Gentle hum',
      img_url: 'https://media.giphy.com/media/XKfEhT0PHSzKMbUBZj/giphy.gif')

    @Kylo = Cat.create!(
      name: 'Kylo',
      mood: 'Relaxed',
      purr_style: 'Low rumble',
      img_url: 'https://media.tenor.com/mGC7-NWoVZsAAAAi/siamese-cat.gif'  
    )

    @Emmy = Cat.create!(
      name: 'Emmy',
      mood: 'Spicy',
      purr_style: 'Sharp vibrato',
      img_url: 'https://gifdb.com/images/high/scratch-pad-cartoon-tabby-cat-4lk0rv3hledc1la4.gif'
    )

    @user1 = User.create!(name: 'Natasha', email: 'natasha@example.com', password: 'password')
    @user2 = User.create!(name: 'Chrissy', email: 'chrissy@example.com', password: 'pokemon')

    UserCat.create!(user: @user1, cat: @Emmy, times_used: 3)
    UserCat.create!(user: @user1, cat: @DuchessMarie, times_used: 2)
    UserCat.create!(user: @user2, cat: @Kylo, times_used: 2)

  end

  it 'can return all cats' do

    get "/api/v1/cats"

  #  binding.pry

    expect(response).to be_successful
    expect(response.status).to eq(200)

    json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json).to be_an(Array)
    expect(json.count).to eq(3)
    expect(json.first[:attributes]).to include(:name)
    expect(json.first[:attributes]).to include(:purr_style)
    expect(json.first[:attributes]).to include(:mood)
    expect(json.first[:attributes]).to include(:img_url)
    
    expect(json.first[:attributes][:name]).to eq('Duchess Marie')
    expect(json.first[:attributes][:purr_style]).to eq('Gentle hum')
    expect(json.first[:attributes][:mood]).to eq('Sleepy')
    expect(json.first[:attributes][:img_url]).to eq('https://media.giphy.com/media/XKfEhT0PHSzKMbUBZj/giphy.gif')
  end

  it 'can return a single cat' do

    get "/api/v1/cats/#{@Kylo.id}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json[:attributes][:name]).to eq('Kylo')
    expect(json[:attributes][:purr_style]).to eq('Low rumble')
    expect(json[:attributes][:mood]).to eq('Relaxed')
    expect(json[:attributes][:img_url]).to eq('https://media.tenor.com/mGC7-NWoVZsAAAAi/siamese-cat.gif')
  end

  it 'returns a 404 error if an cat does not exist' do

    get "/api/v1/cats/99999"

    expect(response).to have_http_status(:not_found)
    json = JSON.parse(response.body)
    expect(json["error"]).to include("Couldn't find Cat with 'id'=99999")

  end
end