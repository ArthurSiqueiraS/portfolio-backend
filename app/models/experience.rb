class Experience
  include Mongoid::Document
  field :start_date, type: Date
  field :end_date, type: Date
  field :summary, type: String, localize: true

  belongs_to :employer
  has_and_belongs_to_many :occupations

  validates_presence_of :start_date, :occupations

  belongs_to :portfolio

  before_validation { |item| assign_default_portfolio(item) }
end
