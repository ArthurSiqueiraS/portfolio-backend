class ProjectStatus
  include Mongoid::Document
  field :name, type: String, localize: true

  has_and_belongs_to_many :projects

  validates :name, presence: true, uniqueness: true
end
