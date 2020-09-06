class CollectionController < ApplicationController
  include Collection

  def initialize
    super
    self.repository = self.repository.new
    self.operations = self.operations.new
  end

  def index
    queried_collection = repository.search(params)

    render json: representer.pagination(params, queried_collection), status: :ok
  end

  def show
    item = repository.find(params[:id])
    if item.nil?
      render status: :not_found
    else
      render json: representer.decorate(item, params[:format], params), status: :ok
    end
  end
end