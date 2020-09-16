class Portfolio
  include Mongoid::Document
  field :birth_date, type: Date
  field :title, type: String, localize: true
  field :summary, type: String, localize: true
  field :phone, type: String
  field :email, type: String
  field :github, type: String
  field :gitlab, type: String
  field :linkedin, type: String
  field :instagram, type: String

  belongs_to :location
  has_many :experiences
  has_many :educations
  has_many :extra_infos
  has_many :skills
  has_many :languages
  has_many :projects
  has_many :technologies

  validates_presence_of :birth_date, :title, :email
end
