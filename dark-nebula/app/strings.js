exports = (typeof window === 'undefined') ? global : window;

exports.stringsAnswers = {
  reduceString: function(str, amount) {
    var newString = '';
    for (var i = 0; i < str.length; i++) {
      if (str[i - 1] !== str[i] && str[i + 1] !== str[i]) {
        newString += str[i];
      }
      else if (str[i - 1] !== str[i]) {
        newString += str[i].repeat(amount);
      }
    }
    return newString;
  },
  wordWrap: function(str, cols) {
    var strArray = str.split('')
    for (var i = cols + 1; i < strArray.length; i += cols) {
      if (strArray[i] == ' ') {
        strArray.splice(i, 1, "\n")
        i++
      }
      else {
        strArray.splice(i, 0, "\n")
        i += 1
      }
    }
    var kamille = strArray.join('')
    return kamille
  },

  reverseString: function(str) {
    return str.split('').reverse().join('')
  }
};
