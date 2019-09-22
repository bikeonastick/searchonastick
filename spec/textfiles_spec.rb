require 'spec_helper'
require 'searchonastick/textfiles'

RSpec.describe Searchonastick::Textfiles do

  it "can find files in textfiles directory" do
    my_dir = "test_text"
    subject.text_dir = my_dir
    require 'fileutils'
    FileUtils.mkdir_p my_dir
    FileUtils.touch("#{my_dir}/one.txt")
    FileUtils.touch("#{my_dir}/two.txt")
    FileUtils.touch("#{my_dir}/three.txt")

    expect(subject.size).to equal(3)
    
    FileUtils.rmtree my_dir
  end
end
