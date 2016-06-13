require "spec_helper"

describe LeanKit::Card do
  describe :find do
    before :each do
      @board_id  = double("boardID")
      @card_id   = double("cardID")
    end

    it "gets the board card whose id is passed" do
      api_call = "/Board/#{@board_id}/GetCard/#{@card_id}"
      LeanKit::Card.should_receive(:get).with(api_call)
      LeanKit::Card.find(@board_id, @card_id)
    end
  end

  describe :find_by_external_id do
    before :each do
      @board_id    = double("boardID")
      @external_id = double("externalID")
    end

    it "gets the board card whose id is passed" do
      api_call = "/Board/#{@board_id}/GetCardByExternalId/#{@external_id}"
      LeanKit::Card.should_receive(:get).with(api_call)
      LeanKit::Card.find_by_external_id(@board_id, @external_id)
    end
  end

  describe :delete_multiple do
    before :each do
      @board_id = double("boardID")
      @card_ids = [ double("cardID_0"), double("cardID_1"), double("cardID_2") ]
    end

    it "deletes the card whose ids are passed" do
      api_call = "/Board/#{@board_id}/DeleteCards"
      LeanKit::Card.should_receive(:post).with(api_call, @card_ids)
      LeanKit::Card.delete_multiple(@board_id, @card_ids)
    end
  end

  describe :delete do
    before :each do
      @board_id  = double("boardID")
      @card_id   = double("cardID")
    end

    it "deletes the board card whose id is passed" do
      api_call = "/Board/#{@board_id}/DeleteCard/#{@card_id}"
      LeanKit::Card.should_receive(:post).with(api_call, {})
      LeanKit::Card.delete(@board_id, @card_id)
    end
  end

  describe :add do
    before :each do
      @board_id  = double("boardID")
      @lane_id   = double("laneID")
      @position  = double("position")
      @body = { "Title" => double("title"), "TypeId" => double("typeID")}
    end

    it "adds the card into the lane and position provided" do
      api_call = "/Board/#{@board_id}/AddCard/Lane/#{@lane_id}/Position/#{@position}"
      LeanKit::Card.should_receive(:post).with(api_call, @body)
      LeanKit::Card.add(@board_id, @lane_id, @position, @body)
    end
  end

  describe :update do
    before :each do
      @board_id = double("boardID")
      @body = { "Id" => double("Id"), "Title" => double("title"), "Description" => double("description") }
    end

    it "updates the card using the title and description provided" do
      api_call = "/Board/#{@board_id}/UpdateCard/"
      LeanKit::Card.should_receive(:post).with(api_call, @body)
      LeanKit::Card.update(@board_id, @body)
    end
  end

  describe :add_multiple do
    before :each do
      @cards = []
      @board_id  = double("boardID")
      @wip_comment = "this is a comment"

      lane_ids = [ double("lane_0"), double("lane_1") ]
      titles = [ double("title_0"), double("title_1") ]
      type_ids = [ double("type_0"), double("type_1") ]

      lane_ids.each_with_index { |item, i|
        @cards[i] = { "LaneId" => lane_ids[i], "Title" => titles[i], "TypeId" => type_ids[i] }
      }
    end

    it "adds the cards into the lanes and positions provided" do
      api_call = "/Board/#{@board_id}/AddCards?wipOverrideComment=" + URI::encode(@wip_comment)
      LeanKit::Card.should_receive(:post).with(api_call, @cards)
      LeanKit::Card.add_multiple(@board_id, @wip_comment, @cards)
    end
  end

  describe :history do
    it "gets the history of card which id is provided" do
      api_call = "/Card/History/#{@board_id}/#{@card_id}"
      LeanKit::Card.should_receive(:get).with(api_call)
      LeanKit::Card.history(@board_id, @card_id)
    end
  end

  describe :move do
    it "gets the history of card which id is provided" do
      @lane_id = 12
      @position = 0
      api_call = "/Board/#{@board_id}/MoveCard/#{@card_id}/Lane/#{@lane_id}/Position/0"
      LeanKit::Card.should_receive(:post).with(api_call,{})
      LeanKit::Card.move(@board_id, @card_id, @lane_id, @position)
    end
  end
end
