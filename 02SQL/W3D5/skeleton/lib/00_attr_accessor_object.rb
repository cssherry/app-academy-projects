class AttrAccessorObject
  def self.my_attr_accessor(*names)

    names.each do |name|
      instance_variable = "@#{name}"
      define_method("#{name}") { instance_variable }

      define_method("#{name}=") { |value| instance_variable = value }
    end

  end
end
