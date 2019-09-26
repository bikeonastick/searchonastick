require 'searchonastick/regex_strategy'

module Searchonastick
  
  class Scanner

    attr_accessor :to_find, :storage, :found_count


    def initialize(scan_target)
      @to_find = scan_target
      @prev_match = false
      build_word_chars()
      reset()
    end

    def build_word_chars()
      @word_chars = ['_']
      @word_chars += ('a'..'z').to_a
      @word_chars += ('A'..'Z').to_a
      @word_chars += ('0'..'9').to_a
    end

    def reset()
      @found_count = 0
      @storage = Array.new(@to_find.size,"")
    end

    #
    # TODO: look at a different model where << does this, but does not return
    # true/false. the count of words found will be stored in a member variable
    # and count increments will need the context of previous/next chars to know
    # whether or not to increment.
    #
    def << (char)
      @last_head = @storage.shift
      @storage.push(char)
#      puts "last_head=#{@last_head}"
#      puts "to_find=#{@to_find}"
#      puts "storage=#{@storage}"
      if(!@word_chars.include?(@last_head))
        if (@storage == @to_find)
          @found_count += 1
          @prev_match = true
        end
      else
        #checking to see if the next char after a match is a non-word char
        #(and therefore keeping the match). if, however, the char immediately
        #followign is a word char, this is a false positive because we're looking
        #for whole words only
        if(@prev_match && @word_chars.include?(char))
          @found_count -= 1
          @prev_match = false
        elsif(@prev_match)
          @prev_match = false
        end

      end
    end

    # creates a window that is the size of the scan target
    # you can just push characters onto the end of this
    # will do comparison when you push a character on
    # will return false if the scan_target is not the same as current_chars
    # will return true when << scan_target == current chars


  end
end
