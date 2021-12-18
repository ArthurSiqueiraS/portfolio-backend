class Education
  include Mongoid::Document
  field :course, type: String, localize: true
  field :title, type: String, localize: true
  field :institution, type: String
  field :start_date, type: Date
  field :end_date, type: Date
  field :summary, type: String, localize: true

  validates_presence_of :course, :institution, :start_date

  belongs_to :portfolio

  before_validation { |item| assign_default_portfolio(item) }
end
