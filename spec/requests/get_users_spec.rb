require 'rails_helper'

describe 'GET /users', type: :request do
  before :each do
    @u_1 = User.create(email: "wes", password: "ema", role: 0, name: "dad", address: "dads", city: "dasd", state: "CO", zip: 80221)
    @u_2 = User.create(email: "wed", password: "ema", role: 0, name: "dad", address: "dads", city: "dasd", state: "CO", zip: 80221)
    @u_3 = User.create(email: "wea", password: "ema", role: 1, name: "dad", address: "dads", city: "dasd", state: "CO", zip: 80221)
  end

  context 'base route' do
    it " returns all users with no parameters" do
      get '/api/v1/users'

      expect(response).to be_successful
      expect(response.status).to eq(200)
      actual = JSON.parse(response.body)["data"]
      expected = User.regular

      expect(actual.size).to eq(3)
      actual.each_with_index do |user, i|
        binding.pry
        expect(actual[i]["id"].to_i).to eq(expected[i]["id"])
        expect(actual[i]["email"]).to eq(expected[i]["email"])
        expect(actual[i]["password"]).to eq(expected[i]["password"])
        expect(actual[i]["name"]).to eq(expected[i]["name"])
        expect(actual[i]["city"]).to eq(expected[i]["city"])
        expect(actual[i]["zip"]).to eq(expected[i]["zip"])
      end
    end
  end

  context '/admin returns admin users only' do

  end
end
