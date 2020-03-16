#saving and loading methods
require 'yaml'

module Save_load
  def save
    File.open("save.yaml", "w+"){|f| f.write(YAML::dump(self))}
  end

  def load
    # save = File.open('save.yaml') {|f| YAML::load(f)}
    # puts save

    File.open("save.yaml") do |f|
      x = YAML::load(f)
      self.turns = x.turns
      self.word = x.word 
      self.turns = x.turns
      self.letter_array = x.letter_array
      self.output = x.output
      self.bad_guesses = x.bad_guesses
      puts "GAME LOADED..."
      sleep 1.5
    end

    # save = YAML::load(File.open("save.yaml", "r"))
    #save.instance_variables.each do |variable, value|
      #self.instance_variable_set(variable, save.variable)
      # puts save.(variable)
      # puts value
      # sleep 1
   # end
  end

  def save?
    if self.guess.downcase == "save"
      puts "game has been saved"
      self.save
      sleep 2
    end
  end

  def load?
    if self.guess.downcase == "load"
      self.load
    end
  end

end
