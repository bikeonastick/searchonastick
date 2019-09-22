module Searchonastick
  
  class Textfiles

    attr_accessor :text_dir

    def initialize(directory='textfiles')
      @text_dir = directory
    end
    def size 
      Dir.glob("#{@text_dir}/*.txt").size
    end
  end

end
