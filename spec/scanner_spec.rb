require 'spec_helper'
require 'searchonastick/scanner'


RSpec.describe Searchonastick::Scanner do
  
  subject { Searchonastick::Scanner.new(['b','a','r']) }

  it "found count is 0 when << pushes chars on and current is not equal to scan_target" do

    subject << 'b'
    expect(subject.found_count).to eq(0)
    
  end

  it "found_count is 1 when << pushes a char on that makes current and scan_target equal" do
    subject << 'b'
    subject << 'a'
    subject << 'r'
    expect(subject.found_count).to eq(1)
  end

  it "decrements found_count when << pushes a char that unmatches a sequence" do 
    subject << 'b'
    subject << 'a'
    subject << 'r'
    expect(subject.found_count).to eq(1)
    subject << 'r'
    expect(subject.found_count).to eq(0)
  end

  it "does not find the word at the end of other words" do
    subject << 'f'
    subject << 'o'
    subject << 'o'
    subject << 'b'
    subject << 'a'
    subject << 'r'
    expect(subject.found_count).to eq(0)
  end

  it "can find a word after a find count cleanup" do
    subject << 'f'
    subject << 'o'
    subject << 'o'
    subject << 'b'
    subject << 'a'
    subject << 'r'
    subject << ' '
    subject << 'b'
    subject << 'a'
    subject << 'r'
    subject << ''
    expect(subject.found_count).to eq(1)
  end
  it "can reveal the current set of chars in its buffer" do
  end

end
