var numbers = "80:70:90:100";


function averageColon(numbers) {
    var array = numbers.split(':');
    var total = array.reduce(function (sum, number) {
        return sum + parseInt(number)
      }, 0);
    return (total/array.length ) ;
    }




console.log( averageColon(numbers) === 85 );
//=> true
