class PortfolioController < ApplicationController
  def index
    I18n.locale = params[:locale] || 'en'

    portfolio = Portfolio.first
    projects = portfolio.projects.desc(:start_date).map { |p| project(p) }
    education = parse_json(portfolio.educations)
    extra_info = parse_json(portfolio.extra_infos)
    skills = parse_json(portfolio.skills.desc(:level))
    languages = parse_json(portfolio.languages)

    render json: parse_json(portfolio).merge({
      projects: projects,
      address: parse_json(portfolio.location),
      experiences: experiences(portfolio.experiences),
      education: education,
      extra_info: extra_info,
      skills: skills,
      languages: languages,
      technologies: technologies(portfolio.technologies),
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
    technologies = parse_json(p.technologies)
    front_end = technologies.select { |t| t['type'] == 'front_end' }
    back_end = technologies.select { |t| t['type'] == 'back_end' }
    employer = parse_json(p.employer)
    occupations = parse_json(p.occupations)
    status = parse_json(p.project_statuses)

    parse_json(p).merge({
      highlights: highlights,
      frontEnd: front_end,
      backEnd: back_end,
      employer: employer,
      occupations: occupations,
      status: status,
    })
  end

  def experiences(list)
    experiences = list.map do |e|
      occupations = parse_json(e.occupations)
      employer = parse_json(e.employer)
      parse_json(e).merge(occupations: occupations, employer: employer)
    end

    experiences.sort do |e1, e2|
      case
      when !e1['end_date'] && !e2['end_date']
        e1['start_date'] < e2['start_date'] ? 1 : -1
      when e1['end_date'] && e2['end_date']
        e1['end_date'] < e2['end_date'] ? 1 : -1
      else
        e1['end_date'] ? 1 : -1
      end
    end
  end

  def technologies(list)
    if params[:frontPageTechnologies]
      return params[:frontPageTechnologies].map do |tech_name|
        parse_json(list.find_by(name: tech_name))
      end
    end

    parse_json(list)
  end
end
