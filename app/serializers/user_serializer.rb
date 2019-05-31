class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :role, :name, :address, :city, :state, :zip, :created_at, :updated_at
end
