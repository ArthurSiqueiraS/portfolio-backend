class ExtraInfo
  include Mongoid::Document
  field :group, type: String, localize: true
  field :title, type: String, localize: true
  field :subtitle, type: String, localize: true
  field :start_date, type: Date
  field :end_date, type: Date
  field :summary, type: String, localize: true
  field :continuous, type: Boolean, default: false

  validates_presence_of :group, :title, :start_date

  belongs_to :portfolio

  before_validation { |item| assign_default_portfolio(item) }
end
