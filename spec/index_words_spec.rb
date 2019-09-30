require 'spec_helper'
require 'searchonastick/index_words'


RSpec.describe Searchonastick::IndexWords do
  
  subject { Searchonastick::IndexWords.new(['my.txt','my_other.txt']) }

  it "adds a word" do
    subject.add_word("foo","my.txt")
    expect(subject.word_count).to eq(1)
  end
  it "adds many words" do
    subject.add_word("foo","my.txt")
    subject.add_word("bar","my.txt")
    subject.add_word("baz","my.txt")
    expect(subject.word_count).to eq(3)
  end
  it "adds a word from 2 files without increasing number of words" do
    subject.add_word("foo","my.txt")
    subject.add_word("foo","my_other.txt")
    expect(subject.word_count).to eq(1)
  end
  it "adds a word from 2 expects found_in to increase in size" do
    subject.add_word("foo","my.txt")
    expect(subject.found_in("foo").size).to eq(1)
    subject.add_word("foo","my_other.txt")
    expect(subject.found_in("foo").size).to eq(2)
  end
  it "adds a word, noting filename and expects that filename to be shown in found_in" do
    subject.add_word("foo","my.txt")
    subject.add_word("foo","my_other.txt")
    expect(subject.found_in("foo").index("my.txt")).not_to be_nil
  end
  it "" do
    subject.add_word("foo","my.txt")
    subject.add_word("bar","my.txt")
    subject.add_word("a","my.txt")
    subject.add_word("to","my.txt")
    subject.add_word("foo","my.txt")
    expect(subject.found_in_times("foo","my.txt")).to eq(2)
  end


end
