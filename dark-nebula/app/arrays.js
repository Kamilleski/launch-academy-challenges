exports = (typeof window === 'undefined') ? global : window;

exports.arraysAnswers = {

  removeWithoutCopy : function(arr, item) {

    for (var i = 0; i < arr.length; i++) {
      if (arr[i] == item) {
        arr.splice(i, 1)
        i--;
      }
    }
    return arr;

  },

  append : function(arr, item) {

    arr.push(item);
    return arr;

  },

  truncate : function(arr) {

    arr.pop();
    return arr;

  },

  prepend : function(arr, item) {

    arr.unshift(item);
    return arr;

  },

  curtail : function(arr) {

    arr.shift();
    return arr;

  },

  concat : function(arr1, arr2) {

    var joined = arr1.concat(arr2);
    return joined;

  },

  insert : function(arr, item, index) {

    arr.splice(index, 0, item);
    return arr;

  },

  count : function(arr, item) {

    var counter = 0
    for (var i = 0; i < arr.length; i++) {
      if (arr[i] == item) {
        counter += 1
      }
    }
    return counter

  },

  duplicates : function(arr) {
    arr.sort();
    results = []
    for (var i = 0; i < arr.length - 1; i++) {
      if (arr[i + 1] == arr[i]) {
        if (arr[i + 1] !== results[results.length -1]) {
          results.push(arr[i + 1])
        }
      };
    };
    return results;

  },

  square : function(arr) {

    squares = arr.map(function(num) {
      return Math.pow(num, 2)
    });
    return squares;

  },

  findAllOccurrences : function(arr, target) {
    indices = []
    for (var i = 0; i < arr.length; i++) {
      if (arr[i] == target) {
        indices.push(i)
      }
    }
    return indices
  }
};
