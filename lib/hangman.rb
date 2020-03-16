require_relative "game"
#require 'open-uri'

#fname = "dictionary.txt"
#url = "https://www.scrapmaker.com/data/wordlists/dictionaries/english_words_basic.txt"

#File.open(fname, "w"){|file| file.write(open(url).read)}
#puts word_array
    #File.open(fname, "w") {|file| file.write(word_array)}
$word_array = []
def get_word_array
  File.open("dictionary.txt", "r") do |file|
    file.readlines.each do |line|
      if line.strip.length >= 5 && line.length <= 12
        $word_array << line.chomp
      end
    end
    
  end
end
get_word_array

def random_word(array)
  array.sample
end

puts random_word($word_array)