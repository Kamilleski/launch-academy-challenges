require_relative "PersonalizedHavocError"

module PartyGoer

  def initialize
    @drinks = 0
  end

  def drink
    if @drinks < 3
      @drinks += 1
      true
    else
      false
    end
  end

  def sing
    "Sing us a song, you're the piano man!"
  end

  def cause_havoc
    raise PersonalizedHavocError, "You should define this yourself!"
  end

  def invited?
  end

end
