class PortfolioController < ApplicationController
  def index
    I18n.locale = params[:locale] || 'en'
    portfolio = Portfolio.first
    experiences = portfolio.experiences.map { |e| experience(e) }
    education = parse_json(portfolio.educations.map)
    extra_info = parse_json(portfolio.extra_infos.map)
    skills = parse_json(portfolio.skills.map)

    render json: parse_json(portfolio).merge({
      address: parse_json(portfolio.location),
      experiences: experiences,
      education: education,
      extraInfo: extra_info,
      skills: skills
    })
  end

  private

  def parse_json(item)
    if item.is_a? Array
      return item.map { |i| parse_json(i) }
    end

    json = item.as_json

    begin
      if item['id']
        json.merge!(id: item['id'].to_s)
        json.delete('_id')
      end
    rescue
    end

    json
  end

  def experience(e)
    occupations = parse_json(e.occupations)
    parse_json(e).merge(occupations: occupations)
  end
end
