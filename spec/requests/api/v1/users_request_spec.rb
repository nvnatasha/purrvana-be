require 'rails_helper'

RSpec.describe 'users API', type: :request do
  before :each do
    host! "localhost"
    User.destroy_all

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

  it 'can return a single user and their cats' do

    get "/api/v1/users/#{@user1.id}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json[:attributes]).to include(:name)
    expect(json[:attributes]).to include(:email)

    expect(json[:attributes][:name]).to eq('Natasha')
    expect(json[:attributes][:email]).to eq('natasha@example.com')

    expect(json[:attributes][:cats]).to be_an(Array)
    expect(json[:attributes][:cats].count).to eq(2)

    expect(json[:attributes][:cats][0]).to include(:name, :mood, :purr_style, :img_url)
    expect(json[:attributes][:cats][0][:name]).to eq('Emmy')
  end

  it 'returns a 404 error if an user does not exist' do

    get "/api/v1/users/99999"

    expect(response).to have_http_status(:not_found)
    json = JSON.parse(response.body)
    expect(json["error"]).to include("Couldn't find User with 'id'=99999")

  end
end
