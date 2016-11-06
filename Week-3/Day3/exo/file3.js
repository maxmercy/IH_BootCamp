var words, message;
words = ["dead","bygone","landing","cheaply","assumed","incorrectly","attention","agent"] ;





// function decoder(array) {
//     var index = 0 ;
//     var secretMessage = '' ;
//     for ( var i = 0; i < array.length; i++) {
//         secretMessage += array[i][index] ;
//
//         index = index == 4? 0 : index +1;
//
//         // if (index == 4) {
//         //   index = 0 ;
//         // } else {
//         //   index++
//         // }
//     }
//     return secretMessage
// };


function decoder(array){
  var  secretMessage = '';
  array.forEach(function(word, index){
    secretMessage += word[index % 5 ]
  })
  return secretMessage
}


message = decoder(words);
console.log(message);
//expected "dynamite"
