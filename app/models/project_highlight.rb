class ProjectHighlight
  include Mongoid::Document
  field :title, type: String, localize: true
  field :description, type: String, localize: true
  field :image, type: String
  field :icon, type: String

  belongs_to :project

  validates_presence_of :title
end
