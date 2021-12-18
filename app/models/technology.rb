class Technology
  include Mongoid::Document
  field :name, type: String
  field :type, type: String
  field :logo, type: String
  field :link, type: String

  has_one :skill, dependent: :destroy
  has_and_belongs_to_many :projects
  belongs_to :portfolio

  validates_presence_of :name, :type
  validates :type, inclusion: %w[front_end back_end]
  validates_uniqueness_of :name

  before_validation { |item| assign_default_portfolio(item) }
end
