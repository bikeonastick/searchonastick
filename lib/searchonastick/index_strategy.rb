require 'searchonastick/search_result'
require 'searchonastick/scanner'
require 'searchonastick/index_words'

module Searchonastick
  
  class IndexStrategy

    attr_accessor :search_string, :text_files, :results, :keep_index, :reuse_index

    @search_string
    @text_files
    @results

    def initialize(keep=false,reuse=false)
      @results = []
      @keep_index = keep
      @reuse_index = reuse
    end

    def search(text_files, search_string)
      @text_files = text_files
      @search_string = search_string
      text_files.docs.each{|file_name|
        search_result = Searchonastick::SearchResult.new(file_name)
        found_times = @index_words.found_in_times(search_string, file_name)
        found_words = []
        if(found_times > 0)
          (1..found_times).each{|x| found_words << search_string}
          search_result.result += found_words
        end
        @results << search_result
      }
      return @results
    end

    def index(text_files)
      @index_words = Searchonastick::IndexWords.new(text_files.docs)
      text_files.docs.each{|file_name|
        IO.foreach(file_name){|line|
          line_words = line.split(" ")
          line_words.each{|word|
            #TODO: should i remove punctuation? Probably want to keep
            #apostrophes
            @index_words.add_word(word,file_name)
          }
        }
      }
    end
  end
end
