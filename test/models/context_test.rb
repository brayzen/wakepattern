require "test_helper"

describe Context do
  let(:context) { Context.new }

  it "must be valid" do
    value(context).must_be :valid?
  end
end
