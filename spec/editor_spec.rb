require 'editor'

RSpec.describe Editor do
  let(:input_command_double) { double("operation", process: "ABC") }
  let(:editor) { described_class.new(input_string:"abc", input_commands: input_command_double) }
  
    it "initializes with an input_string and input_commands" do
      expect(editor.input_string).to eq("abc")
      expect(editor.input_commands).to eq(input_command_double)
    end

    describe "#cursor_position" do
      it "starts with a position of zero" do
        expect(editor.cursor_pos).to eq(0)
      end
    end

    describe "#input_string" do
      it "sets to the input_string argument" do
        expect(editor.input_string).to eq("abc")
      end
    end

    describe "#length" do
      
      it "sets to input_string's length" do
        expect(editor.length).to eq(3)
      end
    end


  # describe "#initialize" do
  #   it " @input_string, @length" do
  #     operation_double = class_double('Operations', build: [1,2,3,4]).as_stubbed_const

  #     expect(editor).to have_attributes(input_string: "abc")
  #     expect(editor).to have_attributes(length: 3)
  #   end

  #   it "sets @input_commands to be an array" do
  #     operation_double = class_double('Operations', build: [1,2,3,4]).as_stubbed_const
      
  #     expect(operation_double).to receive(:build)
  #     expect(editor.instance_variable_get(:@input_commands)).to eq([1,2,3,4])
  #   end
  # end

  describe "#run" do
    it "calls operation's process method" do
      operation_double = class_double('Operations', build: input_command_double).as_stubbed_const
      expect(input_command_double).to receive(:process).once
      editor.run
    end

    it "prints out the input_string" do
      operation_double = class_double('Operations', build: input_command_double).as_stubbed_const
      expect { editor.run }.to output(/abc/).to_stdout
    end
  end

  
end