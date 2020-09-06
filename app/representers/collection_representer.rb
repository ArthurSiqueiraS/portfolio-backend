class CollectionRepresenter < ApplicationRepresenter
  include Collection

  def self.decorator(data_format)
    begin
      decorator_constant = data_format.to_s.camelcase

      self.const_get(decorator_constant)
    rescue NameError
      self
    end
  end

  def self.decorate(item, data_format=nil, params={})
    if item.is_a? Array
      item.map { |i| decorate_item(i, data_format, params) }
    else
      decorate_item(item, data_format, params)
    end
  end

  def self.decorate_item(item, data_format, params)
    begin
      decorator(data_format).decoration(item)
    rescue ArgumentError
      decorator(data_format).decoration(item, params)
    end
  end

  def self.pagination(params, collection)
    perPage = params[:perPage] || collection.count
    perPage = 1 if perPage == 0
    page = Kaminari.paginate_array(collection.to_a).page(params[:page]).per(perPage)
    data = decorate(page, params[:format], params)

    page_data(page, data)
  end

  def self.page_data(page, data)
    current_start = page.empty? ? 0 : (page.current_page - 1) * page.limit_value + 1
    current_end = page.empty? ? 0 : current_start + data.count - 1

    {
      data: data,
      totalCount: page.total_count,
      currentPage: page.current_page,
      currentStart: current_start,
      currentEnd: current_end,
      lastPage: page.total_pages
    }
  end
end