require "spec_helper"

describe LeanKit::Backlog do
  describe :fetch do
    before :each do
      @board_id  = double("boardID")
    end

    it "gets the board backlog" do
      api_call = "/Board/#{@board_id}/Backlog"
      LeanKit::Backlog.should_receive(:get).with(api_call)
      LeanKit::Backlog.fetch(@board_id)
    end
  end
end
