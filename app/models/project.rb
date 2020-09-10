class Project
  include Mongoid::Document
  field :title, type: String, localize: true
  field :description, type: String, localize: true
  field :images, type: Array
  field :start_date, type: Date
  field :end_date, type: Date
  field :logo, type: String

  has_many :project_highlights, dependent: :destroy
  has_and_belongs_to_many :technologies
  belongs_to :employer
  has_and_belongs_to_many :occupations
  has_and_belongs_to_many :project_statuses

  belongs_to :portfolio

  validates_presence_of :title, :description, :start_date, :technologies, 
                        :occupations, :project_statuses, :images

  before_validation { |item| assign_default_portfolio(item) }
end