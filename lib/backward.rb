class Backward
  attr_reader :arg
  
  def initialize(arg)
    @arg = arg.to_i
  end

  def edit(str)
    if str.cursor_pos > 0
      if (str.cursor_pos - arg) > 0
        str.cursor_pos -= arg 
      end
    end
  end
end