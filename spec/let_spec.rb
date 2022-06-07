class Robot
  attr_accessor :position

  def initialize
    @position = false
  end
  
  def move_left
    @position = true
  end
end

RSpec.describe Robot do
  subject(:robot) { Robot.new }

  describe "#position" do
    it "starts at the origin" do
      expect(robot.position).to eq(false)
    end
  end

  describe "move methods" do
    it "moves left" do
      robot.move_left
      expect(robot.position).to eq(true)
    end

    it "moves right" do
      robot.move_right
      expect(robot.position).to eq([1, 0])
    end

    it "moves up" do
      robot.move_up
      expect(robot.position).to eq([0, 1])
    end

    it "moves down" do
      robot.move_down
      expect(robot.position).to eq([0, -1])
    end
  end
end
