require 'spec_helper'
require './lib/pattern'

RSpec.describe Pattern do
  let(:pattern) { "foo,bar,baz" }
  it "should have a length greater than 1" do
    expect(pattern.length).to satisfy("be greater than 1") { |v| v > 1 }
  end
end
