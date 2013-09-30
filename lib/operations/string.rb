class String
  def to_class_constant
    str_class, const_class = self.split('::'), Object
    str_class.each { |value| const_class = const_class.const_get(value) }
    const_class
  end
end
