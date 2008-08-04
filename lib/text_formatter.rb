require 'rubygems'

# Note: Text::Hyphen 1.0.0 uses attr_accessor in a couple of places
# where it should use attr_reader, because a setter is defined 
# immediately afterward; this causes 'method redefined' warnings
# when running 'rake test' since the Hoe gem enables the ruby -w flag.
# To fix this warning, Text::Hyphen must be fixed. so...
# TODO patch Text::Hyphen to fix the 'method redefined' warnings.
gem 'text-hyphen', '>= 1.0.0'
require 'text/hyphen'

# Several methods take a language_code argument. This is the language code
# (like 'en_us') required by Text::Hyphen.
class TextFormatter
    # Replace all words longer than max_width with the results of split_word.
    # Leading and trailing whitespace is eliminated and inline whitespace runs are replaced with a space.
    def split_long_words(string, max_width, language_code)
        words = string.split
        words.collect{|w| w.length > max_width ? split_word(w, max_width, language_code, false) : w}.flatten.join(' ')
    end
    
    # Split one word and return it as an array of substrings no longer than the specified size.
    # Splitting results consist of a hyphenated version (if possible) or by cutting the word into
    # segments no longer than max_width (if hyphenation fails, such as for the word 'xxxxxxxxxxx')
    # Every substring except the last will have a newline appended unless append_newlines is false.
    # The result for a 'word' string containing whitespace is undefined.
    def split_word(word, size, langauge_code, append_newlines = true)
        hyphenated = hyphenate_word(word,size,langauge_code)
        hyphenated_chopped = hyphenated.collect{|w| w.length > size ? chop_word(w, size) : w}.flatten
        if append_newlines
            hyphenated_chopped.collect!{|w| "#{w}\n"} 
            hyphenated_chopped.last.chop!
        end
        return hyphenated_chopped
    end
    
    # Try to hyphenate a word into chunks just barely short enough to fit within the specified size
    def hyphenate_word(word, size, language_code)
        h = TextFormatter.text_hyphenator(language_code)
        hyphenated = h.hyphenate_to(word, size).compact
        
        while (hyphenated.size > 1 && hyphenated.last.length > size) do
            last = hyphenated.pop
            part1, part2 = h.hyphenate_to(last, size).compact
            hyphenated.push(part1)
            hyphenated.push(part2) unless part2.nil?
        end
        return hyphenated
    end
    
    # Simply chop overly long "words" into chunks no longer than the specified size
    def chop_word(word, size)
        chopped = []
        while (!word.nil? && word.length > size) do
            chopped.push word[0,size]
            word = word[size..-1]
        end
        chopped.push(word) # get the last chunk
        return chopped
    end

    # Get a Text::Hyphen instance for a specified language
    def TextFormatter.text_hyphenator(language_code)
        @@hyphenators = Hash.new unless defined? @@hyphenators
        @@hyphenators[language_code] ||= Text::Hyphen.new(:language => language_code, :left => 2, :right => 2)
        return @@hyphenators[language_code]
    end
end
