words = ["dead","bygone","landing","cheaply","assumed","incorrectly","attention","agent"] ;



function decode(array){
  var  secretMessage = '';
  array.forEach(function(word, index){
    secretMessage += word[index % 5 ]
  })
  return secretMessage
}


module.exports = decode
