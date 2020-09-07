class Language
  include Mongoid::Document
  field :name, type: String, localize: true
  field :level, type: Integer

  validates_presence_of :name, :level
  validates :level, numericality: { greater_than: 2, less_than: 6 }

  belongs_to :portfolio

  before_validation { |item| assign_default_portfolio(item) }
end
