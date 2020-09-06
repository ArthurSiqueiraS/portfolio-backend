class CollectionOperations < ApplicationOperations
  include Collection

  attr_accessor :query

  def initialize
    super
    self.repository = self.repository.new
  end

  def process_query(query)
    self.query = query
    query_methods = self.private_methods.select { |method| method.to_s.starts_with?('query_') }

    query_methods.each do |query_method|
      query_field = query_method.to_s.split('_')[1 .. -1].join('_')
      query_parameter = query_field.camelcase(:lower).to_sym
      send(query_method) if query[query_parameter].present?
    end

    field_names = model.attribute_names + model.aliased_fields.keys

    query.select { |k, v| k[0] == '$' || field_names.include?(k.to_s.split('.').first) }
  end

  private

  def query_ids
    query[:_id] = { '$in': query[:ids] }
  end
end