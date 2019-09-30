

module Searchonastick
  
  class IndexMaster
    attr_accessor :files, :words

    def initialize()
      @files = []
      @words = Searchonastick::IndexWords.new()
    end
  end
end

