class Technology
  include Mongoid::Document
  field :name, type: String
  field :type, type: String
  field :logo, type: String
  field :link, type: String

  has_one :skill

  validates_presence_of :name, :type, :logo
  validates :type, inclusion: %w[front_end back_end]
  validates_uniqueness_of :name
end
