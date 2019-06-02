require 'rails_helper'

describe 'GET /users', type: :request do
  before :each do
    @u_1 = User.create(email: "wes", password: "ema", role: 0, name: "dad", address: "dads", city: "dasd", state: "CO", zip: 80221)
    @u_2 = User.create(email: "wed", password: "ema", role: 0, name: "dad", address: "dads", city: "dasd", state: "CO", zip: 80221)
    @u_3 = User.create(email: "wea", password: "elma", role: 1, name: "dad", address: "dads", city: "dasd", state: "CO", zip: 80221)
    @u_4 = User.create(email: "wea", password: "elma", role: 2, name: "dad", address: "dads", city: "dasd", state: "CO", zip: 80221)
  end

  context 'base route' do
    it "returns all users with no parameters" do
      get '/api/v1/users'

      expect(response).to be_successful
      expect(response.status).to eq(200)
      actual = JSON.parse(response.body)["data"]
      expected = User.all
      expect(actual.size).to eq(4)
      actual.each_with_index do |user, i|
        expect(actual[i]["id"].to_i).to eq(expected[i]["id"])
        expect(actual[i]["attributes"]["email"]).to eq(expected[i]["email"])
        expect(actual[i]["attributes"]["password"]).to eq(expected[i]["password"])
        expect(actual[i]["attributes"]["name"]).to eq(expected[i]["name"])
        expect(actual[i]["attributes"]["city"]).to eq(expected[i]["city"])
        expect(actual[i]["attributes"]["zip"]).to eq(expected[i]["zip"])
      end
    end
  end

  context 'user_type parameter' do
    after :each do
      expect(response).to be_successful
      expect(response.status).to eq(200)
      @actual.each_with_index do |user, i|
        expect(@actual[i]["id"].to_i).to eq(@expected[i]["id"])
        expect(@actual[i]["attributes"]["email"]).to eq(@expected[i]["email"])
        expect(@actual[i]["attributes"]["password"]).to eq(@expected[i]["password"])
        expect(@actual[i]["attributes"]["name"]).to eq(@expected[i]["name"])
        expect(@actual[i]["attributes"]["city"]).to eq(@expected[i]["city"])
        expect(@actual[i]["attributes"]["zip"]).to eq(@expected[i]["zip"])
      end
    end
    it "set to regular returns those users only" do
      get '/api/v1/users?user_type=regular'
      @expected = User.regular
      @actual = JSON.parse(response.body)["data"]
      expect(@actual.size).to eq(2)
    end
    it 'set to admin returns those users only' do
      get '/api/v1/users?user_type=admin'
      @expected = User.admin
      @actual = JSON.parse(response.body)["data"]
      expect(@actual.size).to eq(1)
    end
    it 'set to merchant returns those users only' do
      get '/api/v1/users?user_type=merchant'
      @expected = User.merchant
      @actual = JSON.parse(response.body)["data"]
      expect(@actual.size).to eq(1)
    end
  end
end
