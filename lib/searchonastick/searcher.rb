require 'searchonastick/regex_strategy'
require 'searchonastick/scan_strategy'
require 'searchonastick/index_strategy'
require 'benchmark'

module Searchonastick
  
  class Searcher

    SIMPLE = 0
    REGEX = 1
    INDEXED = 2

    attr_accessor :strategy, :search_string, :text_files, :results, 
      :search_impl, :keep_index, :reuse_index 

    attr_reader :index_benchmark, :search_benchmark

    @search_string
    @text_files
    @results

    def initialize(strategy=SIMPLE, text_files=[], search_string="", ki=false, ri=false)
      @strategy = strategy
      @text_files = text_files
      @keep_index = ki
      @reuse_index = ri
      @search_impl = search_factory
      @search_string = search_string
    end

    def search_factory
      case @strategy
      when SIMPLE
        @search_impl = ScanStrategy.new
      when REGEX
        @search_impl = RegexStrategy.new
      when INDEXED
        @search_impl = IndexStrategy.new(@keep_index, @reuse_index)
        @index_benchmark = Benchmark.measure{@search_impl.index(@text_files)}
        @search_impl
      else
        "error"
      end
    end

    def search
      @search_benchmark = Benchmark.measure{
        @results = @search_impl.search(@text_files,@search_string)
      }
      return @results
    end
  end
end
