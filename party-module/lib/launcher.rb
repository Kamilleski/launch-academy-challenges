require_relative "inviter"
require_relative "partygoer"
require_relative "PersonalizedHavocError"

class Launcher
  include PartyGoer
  extend Inviter
end
