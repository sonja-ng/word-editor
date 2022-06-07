require 'forward'

RSpec.describe Forward do
  subject(:forward) { Forward.new(3) }

  it "initializes with an @arg" do
    expect(forward.arg).to eq(3)
  end

  describe "#edit" do
    context "when the new position is not valid" do
      it "does not change cursor position" do
        string = spy('input_string', cursor_pos: 3, input_string: 'apple', length: 5)
        expect(string).not_to receive(:cursor_pos=)
        forward.edit(string)
      end
    end

    context "when the new position is valid" do
      it "changes the string's cursor position" do
        string = instance_double('input_string', cursor_pos: 2, input_string: 'broccoli', length: 8)
        new_string = instance_double('input_string', cursor_pos: 5, input_string: 'broccoli', length: 8)

        expect(string).to receive(:cursor_pos=).with(5)
        expect(forward.edit(string)).to eq(new_string.cursor_pos)
      end
    end
  end

end