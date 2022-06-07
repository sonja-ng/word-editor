require_relative 'operations'
# Original string: abcdefghijklmn  
# Operations: 
# F -> move cursor forward,
# B -> move cursor backward
# R -> replace char  

# Operation string: F2B1F5Rw  -> abcdefwhijklmn (expected output) 
# (Moving forward by 2 chars, move backward by 1 char, move forward 5 chars, replace 1 char to be ‘w’ )
# We can assume that the cursor is at the first character at the beginning. 
# How can we add more operations using OOP if required?

class Editor
  attr_reader :input_commands, :length
  attr_accessor :cursor_pos, :input_string

  def initialize(input_string:, input_commands:)
    @input_string = input_string
    @length = input_string.length
    @cursor_pos = 0
    @input_commands = input_commands
  end

  def [](pos)
    input_string[pos]  
  end

  def []=(pos, new_char)
    input_string[pos] = new_char
  end

  def run
    input_commands.process(self)
    print_string
  end
  
  private 

  def print_string
    puts input_string
  end
end

new_command = "F2B1F5Rw"
command_list = Operations.build(command: new_command)

str_editor = Editor.new(input_string:"abcdefghijklmn", input_commands: command_list)

str_editor.run