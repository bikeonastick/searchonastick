require 'searchonastick/search_result'

module Searchonastick
  
  class RegexStrategy

    attr_accessor :search_string, :text_files, :results

    @search_string
    @text_files
    @results

    def initialize()
      @results = []
    end

    def search(text_files, search_string)
      @text_files = text_files
      @search_string = search_string
      text_files.each{|file_name|
        search_result = Searchonastick::SearchResult.new(file_name)
        IO.foreach(file_name){|line|
          matches = line.scan(search_string)
          if(matches.size > 0)
            search_result.result += matches
          end
        }
        @results << search_result
      }
      return @results
    end
  end
end
