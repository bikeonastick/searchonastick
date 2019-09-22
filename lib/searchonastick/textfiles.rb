module Searchonastick
  
  class Textfiles

    attr_accessor :text_dir, :docs

    def initialize(directory='textfiles')
      @text_dir = directory
      @docs = Dir.glob("#{@text_dir}/*.txt")
    end

    def size 
      @docs.size
    end
  end

end
