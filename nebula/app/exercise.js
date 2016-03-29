exports = (typeof window === 'undefined') ? global : window;

/**
 * This file defines an object with some methods. Some of these methods are
 * populated incorrectly; your job is to fix them. Other methods are not
 * populated at all; your job is to fill them out.
 */

exports.eveningExerciseAnswers = {

  indexOf : function(arr, item) {

    return arr.findIndex(arr, item);

  },

  sum : function(arr) {

    return arr.reduce(function(a, b) {
      return a + b;
    });

  },

  remove : function(arr, item) {

    for (var i = 0; i < arr.length; i++) {
      if (arr[i] === item) {
        arr.splice(i, 1);
      }
    }
    return arr;

  },

  reverseString : function(str) {

    return str.split('').reverse().join('');

  },

  longestSubString : function(str) {

    var strArray = str.split('');
    var longest = strArray[0];
    for (var i = 0; i < strArray.length; i++) {
      if (strArray[i].length > longest.length) {
        var longest = strArray[i];
      };
    };
    return longest;

  },

  letterMoveForward : function(str) {

  },

  capitalizeWords : function(str) {

    var strArray = str.split(' ');
    for (var i = 0; i < strArray.length; i++) {
      strArray[i].charAt(0).toUpperCase + strArray[i].slice(1);
    }
    return strArray.join(' ');
  }
};
