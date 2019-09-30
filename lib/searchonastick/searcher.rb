require 'searchonastick/regex_strategy'
require 'searchonastick/scan_strategy'
require 'searchonastick/index_strategy'

module Searchonastick
  
  class Searcher

    SIMPLE = 0
    REGEX = 1
    INDEXED = 2

    attr_accessor :strategy, :search_string, :text_files, :results, :search_impl

    @search_string
    @text_files
    @results

    def initialize(strategy=SIMPLE,text_files=[])
      @strategy = strategy
      @text_files = text_files
      @search_impl = search_factory
    end

    def search_factory
      case @strategy
      when SIMPLE
        @search_impl = ScanStrategy.new
      when REGEX
        @search_impl = RegexStrategy.new
      when INDEXED
        @search_impl = IndexStrategy.new
        @search_impl.index(@text_files)
        @search_impl
      else
        "error"
      end
    end

    def search
      @results = @search_impl.search(@text_files,@search_string)
    end
  end
end
