require 'spec_helper'
require 'searchonastick/searcher'


RSpec.describe Searchonastick::Searcher do
  it "can be initialized as SIMPLE with no args" do
    expect(subject.strategy).to equal(0)
  end

  it "strategy can be coerced to INDEXED" do
    subject.strategy = 2
    expect(subject.strategy).to equal(Searchonastick::Searcher::INDEXED)
  end
  
  it "can return a RegexStrategy" do
    spec_obj = Searchonastick::Searcher.new(Searchonastick::Searcher::REGEX)
    expect(spec_obj.search_impl).to be_instance_of(Searchonastick::RegexStrategy) 
  end
end
