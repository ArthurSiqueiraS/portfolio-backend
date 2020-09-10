class PortfolioController < ApplicationController
  def index
    I18n.locale = params[:locale] || 'en'

    portfolio = Portfolio.first
    projects = portfolio.projects.map { |p| project(p) }
    experiences = portfolio.experiences.map { |e| experience(e) }
    education = parse_json(portfolio.educations)
    extra_info = parse_json(portfolio.extra_infos)
    skills = parse_json(portfolio.skills)
    languages = parse_json(portfolio.languages)

    render json: parse_json(portfolio).merge({
      projects: projects,
      address: parse_json(portfolio.location),
      experiences: experiences,
      education: education,
      extra_info: extra_info,
      skills: skills,
      languages: languages
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

  def project(p)
    highlights = parse_json(p.project_highlights)
    status = parse_json(p.project_statuses)
    parse_json(p).merge(highlights: highlights, status: status)
  end

  def experience(e)
    occupations = parse_json(e.occupations)
    employer = parse_json(e.employer)
    parse_json(e).merge(occupations: occupations, employer: employer)
  end
end
