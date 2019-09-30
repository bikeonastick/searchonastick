module Searchonastick
  
  class IndexWords
    def initialize(file_names=[])
      @words = {}
      @file_words = {}
      #prepopulate the storage
      file_names.each{|name|
        @file_words[name] = []
      }
    end

    def word_count
      return @words.keys.size
    end

    def add_word(word, file_name)
      #intern the word
      sym_key = word.intern
      if(@words.keys.include?(sym_key))
        # add filename to existing array for that key
        @words[sym_key] << file_name
      else
        #if not add to words
        @words[sym_key] = [file_name]
      end
      @file_words[file_name] << sym_key
      
    end

    #returns array of files found in
    def found_in(word)
      return @words[word.intern]
    end

    # returns number of times word found in file
    def found_in_times(word, file_name)
      ret_val = 0
      file_word_arr = @file_words[file_name].sort
      sym_word = word.intern

      if(file_word_arr.include?(sym_word))
        fi = file_word_arr.index(sym_word)
        li = file_word_arr.rindex(sym_word)
        ret_val = (li - fi) + 1
      end

      return ret_val
    end
  end
end

