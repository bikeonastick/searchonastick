require 'spec_helper'
require 'searchonastick/searcher'


RSpec.describe Searchonastick::Searcher do
  it "can be initialized as SIMPLE with no args" do
    expect(subject.strategy).to equal(0)
  end

  it "strategy can be coerced to REGEX" do
    subject.strategy = 2
    expect(subject.strategy).to equal(Searchonastick::Searcher::INDEXED)
  end
end
