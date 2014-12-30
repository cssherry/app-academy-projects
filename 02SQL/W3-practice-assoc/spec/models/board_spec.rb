require 'spec_helper'

describe Board do
  subject(:board) { Board.first }

  it "has a company " do
    expect(board.company.name).to eq("Google")
  end

  it "has a membership" do
    goog_id = Company.find_by_name("Google").id
    larry_id = Executive.find_by_name("Larry Page").id
    expect(board.memberships.first.member_id).to eq(larry_id)
    expect(board.memberships.first.member_id).to eq(larry_id)
  end

  it "has a member" do
    expect(board.members.first.name).to eq("Larry Page")
  end
  
  it "has a single exchange" do
    nasdaq = Exchange.find_by_name("NASDAQ")
    expect(board.exchange).to eq(nasdaq)
  end
end
