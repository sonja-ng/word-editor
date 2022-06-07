require "byebug"

def parse(input_command:) #"F20B1R3"
  parsed_input_command = []
  num = (0..9).to_a.join("") 
  left = 0
  right = 1

  while right <= input_command.length
    main_command = input_command[left]

    if right == input_command.length || !num.include?(input_command[right])
      command_argument = input_command.slice(left + 1, right - (left + 1))
      command_legend = create_command_legend(main_command, command_argument)
      parsed_input_command.push(command_legend)
      left = right
      right += 1
    else
      right += 1
    end
  end

  parsed_input_command
end

def create_command_legend(command_key, command_arg)
  command_legend = {}
  command_legend[command_key] = command_arg
  command_legend
end

p parse(input_command:"F20B1R3")