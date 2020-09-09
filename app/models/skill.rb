class Skill
  include Mongoid::Document
  field :name, localize: true
  field :level, type: Integer, default: 3

  validates :name, presence: true, uniqueness: true
  validates :level, numericality: { greater_than: 0, less_than: 6 }

  belongs_to :technology, optional: true
  belongs_to :portfolio

  before_validation do |skill|
    if skill.technology && !skill.name
      skill.name = skill.technology.name
    end

    assign_default_portfolio(skill)
  end
end
