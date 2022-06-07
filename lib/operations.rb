require 'byebug'
require 'forwardable'
require 'set'
require_relative 'forward'
require_relative 'backward'
require_relative 'replace'

OPERATORS = Set["F", "B", "R"]

class Operations
  attr_reader :operations

  def self.parse_input_command(input_command:) #"F20B1RX"
    parsed_input_command = []
    left = 0
    right = 1
  
    while right <= input_command.length
      main_command = input_command[left]

      if right == input_command.length || OPERATORS.include?(input_command[right].upcase)
        command_argument = input_command.slice(left + 1, right - (left + 1))
        command_legend = create_command_legend(main_command, command_argument)
        parsed_input_command.push(command_legend)
        left = right
      end
        right += 1
    end
  
    parsed_input_command
  end
  
  def self.create_command_legend(command_key, command_arg)
    command_legend = {}
    command_legend[command_key] = command_arg
    command_legend
  end

  def self.build(command:)
    parsed_commands = parse_input_command(input_command:command)
    commands_objects = []

    parsed_commands.each do |parsed_command|
      parsed_command.each do |key, val|
        case key
        when "F"
          commands_objects.push(Forward.new(val))
        when "B"
          commands_objects.push(Backward.new(val))
        when "R"
          commands_objects.push(Replace.new(val))
        else 
          raise "#{key} is not a valid command"
        end
      end
    end
    self.new(commands_objects)
  end

  def initialize(operations)
    @operations = operations
  end

  def process(string)
    # debugger
    operations.each do |operation|
      operation.edit(string)
    end
  end
end

