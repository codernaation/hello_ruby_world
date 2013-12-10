class String
  def to_class
    str_class, const_class = self.split('::'), Object
    str_class.each { |value| const_class = const_class.const_get(value) }
    const_class
  end

  def symbolize
    self.split('::').last.downcase.to_sym
  end
end