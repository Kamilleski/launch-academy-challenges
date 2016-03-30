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
    var words = str.split(' ');
    var lines = [];
    var i = 0;
    while (i < words.length) {
      var line = words[i] + ' ';
      i++;
      while ((line + words[i]).length <= cols && i < words.length) {
        line += words[i] + ' ';
        i++;
      };
      lines.push(line.trim());
    };
    return lines.join('\n');
  },

  reverseString: function(str) {
    return str.split('').reverse().join('')
  }
};
