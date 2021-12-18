class Employer
  include Mongoid::Document
  field :name, type: String
  field :link, type: String

  has_and_belongs_to_many :experiences
  has_and_belongs_to_many :projects

  validates :name, presence: true, uniqueness: true
end
