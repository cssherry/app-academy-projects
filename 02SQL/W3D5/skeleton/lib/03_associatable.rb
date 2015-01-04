require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    class_name.to_s.constantize
  end

  def table_name
    return 'humans' if class_name.to_s.tableize == 'humen'
    @table_name ||= class_name.to_s.tableize
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    @class_name = options[:class_name] || name.to_s.camelcase
    @foreign_key = options[:foreign_key] || "#{name}_id".to_sym
    @primary_key = options[:primary_key] || :id
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    @class_name = options[:class_name] || name.to_s.camelcase.singularize
    @foreign_key = options[:foreign_key] || "#{self_class_name.singularize.underscore}_id".to_sym
    @primary_key = options[:primary_key] || :id
  end
end

module Associatable
  # Phase IIIb

  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    assoc_options[name] = options #has to be up here, not in define_method block
    define_method(name) do
      current_id = id
      primary_key = options.send(:primary_key)
      model_class = options.send(:model_class)
      result = model_class.where(primary_key => current_id)
      result.first
    end
  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, self.to_s, options)
    define_method(name) do
      current_id = id
      foreign_key = options.send(:foreign_key)
      model_class = options.send(:model_class)
      model_class.where(foreign_key => current_id)
    end
  end

  def has_one_through(name, through_name, source_name)
    current_class = self
    define_method(name) do
      current_class.belongs_to(through_name)
      through_options = assoc_options[through_name]
      current_class.belongs_to(source_name)
      source_options = through_options.model_class.assoc_options[source_name]

      current_id = id
      through_primary_key = through_options.send(:primary_key)
      through_model_class = through_options.send(:model_class)
      through_result = through_model_class.where(through_primary_key => current_id)

      through_id = through_result.first.id
      primary_key = source_options.send(:primary_key)
      model_class = source_options.send(:model_class)
      result = model_class.where(primary_key => through_id)
      result.first
    end
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
    @assoc_options ||= {}
  end

  def assoc_options=(name, value)
    @assoc_options[name] = value
  end
end

class SQLObject
  # Mixin Associatable here...
  extend Associatable
  include Searchable


end
