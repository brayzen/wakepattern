require "test_helper"

describe BetaUser do
  let(:beta_user) { BetaUser.new }

  it "must be valid" do
    value(beta_user).must_be :valid?
  end
end
