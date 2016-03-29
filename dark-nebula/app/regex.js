exports = (typeof window === 'undefined') ? global : window;

exports.regexAnswers = {
  containsNumber : function(str) {
    if (str.match(/\d/) !== null) {
      return true
    }
    else {
      return false
    }
  },

  containsRepeatingLetter : function(str) {
    if (str.match(/([a-z])\1/i) !== null) {
      return true
    }
    else {
      return false
    }
  },

  endsWithVowel : function(str) {
    if (str.match(/[aeiou]$/i) !== null) {
      return true
    }
    else {
      return false
    }
  },

  captureThreeNumbers : function(str) {
    kamille = str.match(/\d{3}/)
    if (kamille !== null) {
      return kamille[0]
    }
    else {
      return false
    }
  },

  matchesPattern : function(str) {
    if (str.match(/^\d{3}-\d{3}-\d{4}$/) !== null) {
      return true
    }
    else {
      return false
    }

  },

  isUSD : function(str) {

  }
};
