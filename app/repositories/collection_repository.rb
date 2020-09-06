class CollectionRepository < ApplicationRepository
  include Collection

  def find(ids)
    model.find(ids)
  end

  def find_by(query)
    model.find_by(query)
  end

  def search(params={}, collection=model)
    query = {}
    params.each { |k, v| query[k.to_sym] = v }
    query = operations.new.process_query(query)

    queried_collection = collection.where(query)

    order_collection(queried_collection, params)
  end

  def where(query)
    model.where(query)
  end

  private

  def order_collection(collection, params)
    if params[:orderBy]
      return params[:orderDirection].to_s == 'descending' ?
        collection.desc(params[:orderBy]) :
        collection.asc(params[:orderBy])
    else
      return collection.desc(:created_at)
    end
  end
end