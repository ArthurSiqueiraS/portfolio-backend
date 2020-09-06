class CollectionGenerator < Rails::Generators::NamedBase
  def create_controller
    create_abstraction('Controller')
  end

  def create_operations
    create_abstraction('Operations')
  end

  def create_repository
    create_abstraction('Repository')
  end

  def create_representer
    item = name.underscore.singularize

    create_abstraction('Representer',
      <<-RUBY
      def self.decoration(#{item})
        #{item}.as_json
      end
      RUBY
    )

    empty_directory "#{concept_folder}#{file_name.pluralize}_representer/"
  end

  def add_to_routes
    route_name = name.underscore.pluralize

    inject_into_file 'config/routes.rb', "\tresources :#{route_name}, only: [:index, :show]\n", after: "# Collection routes\n"
  end

  private

  def concept_folder
    "app/concepts/#{file_name.singularize}/"
  end

  def create_abstraction(abstraction, body='')
    create_file abstraction_file(abstraction), abstraction_class(abstraction, body)
  end

  def abstraction_file(abstraction)
    "#{concept_folder}#{file_name.pluralize}_#{abstraction.downcase}.rb"
  end

  def abstraction_class(abstraction, body)
    <<-RUBY
class #{class_name.pluralize}#{abstraction} < Collection#{abstraction}
#{body}end
    RUBY
  end
end