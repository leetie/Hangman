#saving and loading methods
require 'yaml'

module Save_load
  def save
    File.open("save.yaml", "w+"){|f| f.write(YAML::dump(self))}
  end

  def load
    YAML::load("save.yaml")
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
