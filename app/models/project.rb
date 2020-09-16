class Project
  include Mongoid::Document
  field :title, type: String, localize: true
  field :description, type: String, localize: true
  field :images, type: Array
  field :start_date, type: Date
  field :end_date, type: Date
  field :logo, type: String
  field :thumbnail, type: String
  field :url, type: String
  field :repository, type: String

  has_many :project_highlights, dependent: :destroy
  has_and_belongs_to_many :technologies
  belongs_to :employer
  has_and_belongs_to_many :occupations
  has_and_belongs_to_many :project_statuses

  belongs_to :portfolio

  validates_presence_of :title, :description, :start_date, :technologies, 
                        :occupations, :images

  before_validation do |item|
    if item.thumbnail.nil?
      item.thumbnail = item.images[0]
    end
    assign_default_portfolio(item)
  end
end