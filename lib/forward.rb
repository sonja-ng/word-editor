class Forward
  attr_reader :arg

  def initialize(arg)
    @arg = arg.to_i
  end

  def edit(str)
     if new_pos_valid?(str, arg)
      str.cursor_pos += arg
     end
  end

  private
    def new_pos_valid?(str, arg)
      str.cursor_pos + arg < str.length
    end

end