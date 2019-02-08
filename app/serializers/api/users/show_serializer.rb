class Api::Users::ShowSerializer < Api::UserSerializer
  attributes :id, :name, :surname, :sex, :age, :latitude, :longitude
end
