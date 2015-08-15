require 'rails helper'

describe Vote do
  @vote = Vote.new
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
         expect ( @vote.value ).to eq(1).or eq(-1)
      end
    end
  end
end
