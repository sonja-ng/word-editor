class Replace
  attr_reader :arg
  
  def initialize(arg)
    @arg = arg
  end

  def edit(str)
    str[str.cursor_pos]= arg
  end
end