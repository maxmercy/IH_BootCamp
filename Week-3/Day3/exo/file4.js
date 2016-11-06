// var sentence, message;

var sentence = "fill the proper tank for the cow"



function decode(array){
  var  secretMessage = '';
  array.forEach(function(word, index){
    secretMessage += word[index % 5 ]
  })
  return secretMessage
}


// function superDecode(sentence, instruction1,instruction2) {
//   var arrayWord = sentence.split(' ');
//   var arrayOdd = [] ;
//   var arrayEven = [];
//   for ( var i = 0; i < arrayWord.length; i++) {
//       if (i%2==0) {
//           arrayEven.push(arrayWord[i]);
//       } else {
//           arrayOdd.push(arrayWord[i]);
//       }
//   }
//   if (instruction1 == "odd" ) {
//     var secretArray = arrayOdd;
//   }else {
//     var secretArray = arrayEven;
//   }
//   if (instruction2 == "backwards") {
//       secretArray = secretArray.reverse()
//   }
//   return decode(secretArray);
// }

function superDecode(sentence,type,order){
  var array = sentence.split(' ');
  array = array.filter(function(word,index){
return (type == 'even'? index %2 == 0:index %2 != 0);
});
array = (order == 'backwards'? array.reverse():array);
return decode(array)
}


message = superDecode(sentence, "even" , "backwards");
console.log(message);
//expected "dynamite"
