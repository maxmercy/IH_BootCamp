// creation of a constructor.
//code en commun mis dans le prototype sous fore de 'hash'.


var Car = function(model,noise) {
      this.model = model;
      this.noise = noise;
};

// Car.prototype.makeNoise = function () {
//   console.log('the ' + this.model+ ' does ' + this.noise);
// }

Car.prototype  = {
  wheels: 4 ,
  makeNoise: function () {
    console.log('the ' + this.model+ ' does ' + this.noise);
  }
}

var car1 = new Car('Twingo','Bip Bip');
var car2 = new Car('Laguna','RoumRoumRoum');
var car3 = new Car('F1','VVRRRORRROOROV');

car1.makeNoise()
car2.makeNoise()
car3.makeNoise()

console.log(car1.wheels)
