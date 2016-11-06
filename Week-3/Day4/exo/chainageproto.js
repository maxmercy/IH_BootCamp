

function Animal(age){
  this.age = age;

}

Animal.prototype.sayAge = function(){
console.log("Hi, I'am " + this.age + " old.");
}

function Dog(age){
  Animal.call(this, age);   // coma not dot!!!

}

Animal.prototype.noise = "bau";

Dog.prototype = Animal.prototype

var medor = new Dog("32 years");

medor.sayAge();
