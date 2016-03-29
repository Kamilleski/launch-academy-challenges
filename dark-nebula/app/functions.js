exports = (typeof window === 'undefined') ? global : window;

exports.functionsAnswers = {
  isPrime : function(num) {
    var ret = true;

     for (i = 2; i < num; i++) {
       if (num % i === 0) {
         ret = ret && false;
       break;
       }
       else if (num % i !== 0) {
         ret = ret && true;
       }
     }
     return ret; 
  },

  arraySum : function(array) {
    return array.reduce(function(a, b) {
      return a + b
    })
  },

  fizzBuzz : function(num) {

    if (typeof num !== 'number') {
      return false
    }
    else {
      if (num % 15 === 0) {
        return 'fizzbuzz'
      }
      else if (num % 5 === 0) {
        return 'buzz'
      }
      else if (num % 3 === 0) {
        return 'fizz'
      }
      else {
        return num
      }
    }
  }
};
