require "spec_helper"

describe Betting do

  describe "#intialize" do

    let(:stash) { Betting.new }
    let(:rick_ross) { Betting.new(100000) }
    let(:launcher) { Betting.new(10) }

    it "gives the player an amount of money they specify" do
    expect(rick_ross.money).to eq(100000)
    expect(launcher.money).to eq(10)
    end

  end

end
