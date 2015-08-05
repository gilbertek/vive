require 'spec_helper'
require './lib/path'

RSpec.describe Path do
  let(:path) { "foo/bar/baz/" }
  it "should have a length greater than 1" do
    expect(path.length).to satisfy("be greater than 1") { |v| v > 1 }
  end
end
