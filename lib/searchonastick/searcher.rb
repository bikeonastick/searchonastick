module Searchonastick
  
  class Searcher

    SIMPLE = 0
    REGEX = 1
    INDEXED = 2

    attr_accessor :strategy

    def initialize(strategy=SIMPLE)
      @strategy = strategy
    end

  end

end
