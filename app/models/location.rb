class Location
  include Mongoid::Document
  field :country, type: String, localize: true
  field :country_code, type: String
  field :state, type: String
  field :state_code, type: String
  field :city, type: String

  validates_presence_of :country, :country_code, :state, :state_code, :city
end
