require 'spec_helper'
require 'searchonastick/regex_strategy'


RSpec.describe Searchonastick::RegexStrategy do

  it "very basic test to start" do
    expect(subject).to be_instance_of(Searchonastick::RegexStrategy)
  end

  before(:context) do
    @my_dir = "test_text"
    require 'fileutils'
    FileUtils.mkdir_p @my_dir
    @test_files = [ "#{@my_dir}/one.txt","#{@my_dir}/two.txt","#{@my_dir}/three.txt"]
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
      to_search = @test_files
      subject.search(to_search, /\bba[rz]{1}\b/)
      expect(subject.results.size).to eq(3)
    end
    it "finds five matches in results" do
      to_search = @test_files 
      subject.search(to_search, /\bba[rz]{1}\b/)
      match_count = 0
      subject.results.each{|result| 
        match_count += result.count}
      expect(match_count).to eq(5)
    end
  end
end
