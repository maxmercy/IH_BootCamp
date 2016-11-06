


function caesarCipher (message,shift = -3) {

  var messageArray = message.split('');
  var coded = [] ;
  coded = messageArray.map(function (letter) {

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



var encrypted = caesarCipher("Et tu, brute?", 6)
// var encrypted = caesarCipher("brutus");

console.log(encrypted);

//=> "_orqrp"
