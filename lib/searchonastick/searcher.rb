module Searchonastick
  
  class Searcher

    SIMPLE = 0
    REGEX = 1
    INDEXED = 2

    attr_accessor :strategy, :search_string, :text_files, :results, :search_impl

    @search_string
    @text_files
    @results

    def initialize(strategy=SIMPLE)
      @strategy = strategy
      @search_impl = search_factory
    end

    def search_factory
      case @strategy
      when SIMPLE
        @search_impl = "foo"
      when REGEX
        @search_impl = RegexStrategy.new
      when INDEXED
        @search_impl = "bar"
      else
        "error"
      end
    end

    def search
      @results = @search_impl.search(@text_files,@search_string)
    end


  end

end
