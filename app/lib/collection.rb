module Collection
  attr_accessor :concept, :model, :repository, :operations, :representer

  def initialize
    class_name = self.class.name
    abstraction = class_name =~ /([a-z][A-z][a-z]*)$/
    self.concept = self.class.name[0..abstraction]

    model = concept.singularize

    self.model = model.constantize
    self.repository = get_constant('Repository')
    self.operations = get_constant('Operations')
    self.representer = get_constant('Representer')
  end

  private

  def get_constant(abstraction)
    begin
      "#{self.concept}#{abstraction}".constantize
    rescue NameError
      nil
    end
  end
end