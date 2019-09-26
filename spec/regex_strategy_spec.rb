require 'spec_helper'
require 'searchonastick/regex_strategy'
require 'searchonastick/textfiles'


RSpec.describe Searchonastick::RegexStrategy do

  it "very basic test to start" do
    expect(subject).to be_instance_of(Searchonastick::RegexStrategy)
  end

  before(:context) do
    @my_dir = "test_text"
    require 'fileutils'
    FileUtils.mkdir_p @my_dir
    @test_files = [ "#{@my_dir}/one.txt","#{@my_dir}/two.txt","#{@my_dir}/three.txt"]
    @textfiles = Searchonastick::Textfiles.new
    @textfiles.docs = @test_files
    test_strings = [ "bar\nbaz", "foobar", "baz baz bar\nfoobar" ]
    @test_files.each_with_index{|fn,index|
      file=File.open(fn,'w')
      file.puts(test_strings[index])
      file.close()
    }
  end
  after(:context) do
    FileUtils.rmtree @my_dir
  end

  describe "needs files for test" do
    it "creates a search_result for each file" do
      to_search = @textfiles
      subject.search(to_search, "bar")
      expect(subject.results.size).to eq(3)
    end
    it "finds two matches in results" do
      to_search = @textfiles 
      results = subject.search(to_search, "bar")
      match_count = 0
      results.each{|result| 
        match_count += result.count}
      expect(match_count).to eq(2)
    end
  end
end
