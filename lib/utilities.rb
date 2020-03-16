module Utilities
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
end