require 'backward'

RSpec.describe Backward do
  subject(:backward) { Backward.new(4) }

  describe "#arg" do
    it { is_expected.to have_attributes(:arg => 4) }
  end

  describe "#edit" do
    context "when input string's cursor position is at zero" do
      it "does nothing" do
        input_string = double("input_string", cursor_pos: 0, length: 10)
        allow(input_string).to receive(:cursor_pos=)

        expect(input_string).not_to receive(:cursor_pos=)
        backward.edit(input_string)
      end
    end

    context "when input string's cursor position is greater than zero" do
      it "manipulates input string's cursor value" do
        input_string = double("input_string", cursor_pos: 5, length: 10)
        allow(input_string).to receive(:cursor_pos=)
  
        new_string = double("input_string", cursor_pos: 1, length: 10)
        expect(input_string).to receive(:cursor_pos=)
        expect(backward.edit(input_string)).to eq(new_string.cursor_pos)
      end
    end
    
  end
end