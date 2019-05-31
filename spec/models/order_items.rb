require 'rails_helper'

describe Order do
  it {should have_many(:items).through(:order_items)}
end
