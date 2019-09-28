require 'searchonastick/search_result'
require 'searchonastick/scanner'

module Searchonastick
  
  class ScanStrategy

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
      search_chars = search_string.chars
      compare_chars = Array.new(search_chars.size,"")
      text_files.docs.each{|file_name|
        search_result = Searchonastick::SearchResult.new(file_name)
        IO.foreach(file_name){|line|
          scanner = Searchonastick::Scanner.new(@search_string)
          matches = []
          # scan the line for search_string
          line_chars = line.each_char
          matcher_ix = 0
          if(line_chars.size >= search_chars.length)
            line_chars.each_with_index{ |char,ix|
              scanner << char
            }
            matches += scanner.found_vals
          end

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
