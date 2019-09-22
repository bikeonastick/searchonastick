require 'spec_helper'
require 'searchonastick/textfiles'


RSpec.describe Searchonastick::Textfiles do
  before(:context) do
    @my_dir = "test_text"
    require 'fileutils'
    FileUtils.mkdir_p @my_dir
    FileUtils.touch("#{@my_dir}/one.txt")
    FileUtils.touch("#{@my_dir}/two.txt")
    FileUtils.touch("#{@my_dir}/three.txt")
  end
  after(:context) do
    FileUtils.rmtree @my_dir
  end

  describe "with touches_files" do

    it "can find files in textfiles directory" do
      subject.text_dir = @my_dir
      expect(subject.size).to equal(3)
    end
  end
end
