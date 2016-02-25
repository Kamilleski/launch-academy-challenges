class SuperHero
  attr_reader :public_identity

  def initialize(public_identity, secret_identity)
    @public_identity = public_identity
    @secret_identity = secret_identity
  end

  def species
    "Human"
  end

  def home
    "Earth"
  end

  def fans_per_thousand
    500
  end

  def powers
    ""
  end

  def weakness
    ""
  end

  def backstory
    "This superhero was borne of"
  end

  def speed_in_mph
    60
  end

  def health
    100
  end

  def psychic?
    false
  end

  private
  attr_reader :secret_identity
end

class Speedster < SuperHero
  def speed_in_mph
    super * 1000
  end

  def backstory
    "#{super} cheetah blood and roadrunner feathers."
  end

  def powers
    "#{super}Runs faster than a speeding tortoise."
  end

  def weakness
    "#{super}Brussels Sprouts"
  end
end

class Brawler < SuperHero
  def backstory
    "#{super} the combined sweat of every WWE wrestler."
  end

  def powers
    "#{super}Fights harder than an MMA fighter."
  end

  def weakness
    "#{super}Folding Chairs"
  end

  def health
    super * 20
  end
end

class Detective < SuperHero
  def backstory
    "#{super} a lifetime of watching film noir."
  end

  def powers
    "#{super}Can sleuth the internet all day without eyestrain."
  end

  def weakness
    @secret_identity = "Luke Bayne"
  end

  def speed_in_mph
    super / 6
  end
end

class Demigod < SuperHero
  def backstory
    "#{super} the spit of all the Norse gods and goddesses."
  end

  def powers
    "#{super}Can crush mortals on a whim."
  end

  def weakness
    "#{super}Dwarf Magic"
  end

  def home
    "Cosmic Plane"
  end
end

class JackOfAllTrades < SuperHero
  def backstory
    "#{super} twelve years of full-time community college attendance."
  end

  def powers
    "#{super}Knows how to write (but not speak) 20 languages."
  end

  def weakness
    "#{super}Feminine Charm"
  end

  def species
    "Alien"
  end

  def home
    "Venus"
  end

  def psychic?
    true
  end
end

class WaterBased < SuperHero
  def backstory
    "#{super} Ariel's tears when she left the sea."
  end

  def powers
    "#{super}Survives on only water and plankton."
  end

  def weakness
    "#{super}Nitrogen"
  end

  def home
    "#{super}'s Oceans"
  end

  def fans_per_thousand
    super / 100
  end

  def psychic?
    true
  end
end
