require 'replace'

RSpec.describe Replace do
  subject(:replace) { Replace.new("X") }

  describe "#initialize" do
    it { is_expected.to have_attributes(:arg => "X") }
  end

  describe "#edit" do
    it "calls input string's []= method" do
      string = double("string", cursor_pos: 3, input_string: "abcde", length: 5)
      new_string = double("string", cursor_pos: 3, input_string: "abcXe", length: 5)

      allow(string).to receive(:[]=)

      expect(string).to receive(:[]=)
      
      replace.edit(string)
    end

    it "replaces string character with @arg" do
      string = double("string", cursor_pos: 3, input_string: "abcde", length: 5)
      new_string = double("string", cursor_pos: 3, input_string: "abcXe", length: 5)
      
      allow(string).to receive(:[]=)

      expect(replace.edit(string)).to eq("X")
    end
  end
end