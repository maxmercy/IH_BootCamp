function caesarCipher (shift = -3) {
  return function(message) {
  var messageArray = message.split('');
  var coded = [] ;
  coded = messageArray.map(exit
    function (letter) {

      if (letter >= "a" && letter <= "z") {
          var codeChar = (letter.charCodeAt(0) + shift);
          if (codeChar > 122) { codeChar = codeChar - 26 }
          if (codeChar < 97) { codeChar = codeChar + 26 }
          return String.fromCharCode(codeChar);

      }else if  (letter >= "A" && letter <= "Z") {
          var codeChar = (letter.charCodeAt(0) + shift);
          if (codeChar > 90) { codeChar = codeChar - 26 }
          if (codeChar < 65) { codeChar = codeChar + 26 }
          return String.fromCharCode(codeChar);
      }else {
          return letter;
      }
      // return String.fromCharCode(letter.charCodeAt(0) - 3);
  } );
    return coded.join('')
  }
}





var caesarSix = caesarCipher(+35);
var caesarMinThree = caesarCipher(-3);

// var encrypted6 = caesarSix("Et tu, brute?");
console.log(caesarSix("Et tu, brute?"));
// console.log(caesarMinThree("Et tu, brute?"));
//=> "_orqrp"
