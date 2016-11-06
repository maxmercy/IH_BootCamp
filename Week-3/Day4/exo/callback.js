// function sleep (time,message) {
//   setTimeout(message, time*1000);
// }
//
// sleep(10,function () {
//   console.log("It's been 10 seconds");
// })
//
//
// sleep(5,function () {
//   console.log("It's been 5 seconds");
// })
//
//
// sleep(1,function () {
//   console.log("It's been 1 seconds");
// })


function countdown (n) {
    if (n<0) {
      console.log('blast off ! ') ;
      return
    } else {
      console.log(n);
      setTimeout(function() {countdown(n)}, 500);
    }
    n--
};

toto.fo
countdown(7)
