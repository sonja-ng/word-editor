require "operations"

RSpec.describe Operations do
  subject(:operations_class) { Operations }
  let(:move_command) { double("move_command") }
  
  
  describe ".parse_input_command" do
    it "takes in a command string and returns an array of hashes, with special directions as key and arguments as values" do 
      expect(operations_class.parse_input_command(input_command:"R1R2")).to eq([{"R"=>"1"},{"R"=>"2"}])
    end
  end

  describe ".create_command_legend" do
    it "takes in two arguments and creates a hash object" do
      expect(operations_class.create_command_legend("a", 1)).to eq({ "a" => 1 })
    end
  end

  describe ".build" do
    let (:operation_instance) { double("Operations", :new) }

    it "instantiates an Operations instance" do

      expect(operations_class).to receive(:new)
      operations_class.build(command: "F1")
    end

    it "sets @operations to be an array equals to input argument" do
      operation_instance = Operations.new("F1F2")
      expect(operation_instance.operations).to eq("F1F2")
    end
    
  end

  describe "#process" do
    let(:move_command) { double("move_command") }
    let(:move_command2) { double("move_command") }
    let(:move_command3) { double("move_command") }

    before do
      allow(move_command).to receive(:edit)
      allow(move_command2).to receive(:edit)
      allow(move_command3).to receive(:edit)     
    end
    
    it "processes an input string" do
      moves = []
      moves << move_command

      operation = Operations.new(moves)
      operation_variable = operation.instance_variable_get(:@operations)
      expect(operation_variable).to be_instance_of(Array)
      expect(operation_variable).to contain_exactly(move_command)
      expect(move_command).to receive(:edit)

      operation.process("abc")
    end

    context "when @operations have more than one element" do
     

      it "every element is called once" do
        moves = []
        moves.push(move_command, move_command2, move_command3)
        operation = Operations.new(moves)
        
        expect(move_command).to receive(:edit).with("abc").once
        expect(move_command2).to receive(:edit).with("abc").once
        expect(move_command3).to receive(:edit).with("abc").once

        operation.process("abc")
      end
    end
  end


end