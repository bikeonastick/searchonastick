module Searchonastick
  
  class SearchResult

    attr_accessor :result, :name

    def initialize(file_name)
      @name = file_name
      @result = []
    end

    def count
      @result.size
    end
  end
end
