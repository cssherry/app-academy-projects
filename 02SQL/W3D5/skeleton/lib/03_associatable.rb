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

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.

  end
end

class SQLObject
  # Mixin Associatable here...
  extend Associatable
  include Searchable


end
