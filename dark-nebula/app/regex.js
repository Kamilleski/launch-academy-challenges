exports = (typeof window === 'undefined') ? global : window;

exports.regexAnswers = {
  containsNumber : function(str) {
    if (str.includes("[0-9]")) {
      return true
    }
    else {
      return false
    }

  },

  containsRepeatingLetter : function(str) {

  },

  endsWithVowel : function(str) {

  },

  captureThreeNumbers : function(str) {

  },

  matchesPattern : function(str) {

  },

  isUSD : function(str) {

  }
};
