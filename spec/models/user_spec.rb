require 'rails_helper'

describe User do
  context 'relationships' do
    it {should have_many :orders}
    it {should have_many :items}
  end
  context 'scopes' do
    it 'regular - returns all non admin or merchant users' do
      u_1 = User.create(email: "wes", password: "ema", role: 0, name: "dad", address: "dads", city: "dasd", state: "CO", zip: 80221)
      u_2 = User.create(email: "wes", password: "ema", role: 1, name: "dad", address: "dads", city: "dasd", state: "CO", zip: 80221)
      actual = User.regular

      expect(actual).to eq(u_1)
    end
  end
end
