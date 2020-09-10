class Occupation
  include Mongoid::Document
  field :name, type: String, localize: true
  field :description, type: String, localize: true

  has_and_belongs_to_many :experiences
  has_and_belongs_to_many :projects

  validates :name, presence: true, uniqueness: true
end
