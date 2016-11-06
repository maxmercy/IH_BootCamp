
var array = [ 2, -5, 10, 5, 4, -10, 0];


function process(data) {
    var result = []
    for ( var i = 0; i < data.length; i++) {
        for ( var j = 0; j < data.length; j++) {
            if (data[i] + data[j] == 0) {
                result.push( i + ',' + j )

            }


        }
    }
    return result;
}

console.log(process(array));
// var results = process(exampleArray);
// console.log(results);
