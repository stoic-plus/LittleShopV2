require 'rails_helper'

describe User do
  it {should have_many :orders}
  it {should have_many :items}
end
