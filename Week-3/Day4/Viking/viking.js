var Viking = function(name,health,strength) {
      this.name = name;
      this.health = health;
      this.strength = strength;
      this.score = 0
};

Viking.prototype  = {
    damagegive: function () {
    return this.strength * Math.random();
  }
}

var viking0 = new Viking('Ayelene',200, 60);
var viking1 = new Viking('Otto',200, 60);
var viking2 = new Viking('Maxime',200, 60);
var viking3 = new Viking('Maximillian',200, 60);
var viking4 = new Viking('Mathias',200, 60);
var viking5 = new Viking('Zoe',200, 60);
var viking6 = new Viking('David',200, 60);
var viking7 = new Viking('Mariana',200, 60);
var viking8 = new Viking('Brigth',200, 60);
var viking9 = new Viking('Olaf',200, 60);
var vikingsHord = [viking0,viking1,viking2,viking3,viking4,viking5,viking6,viking7,viking8,viking9]

function attack(vikingA, vikingB) {
        var damA = Math.round(vikingA.damagegive()) ;
        vikingB.health = vikingB.health - damA ;
        console.log( vikingA.name + " removes " + damA + " to " + vikingB.name + " health, he has "+ vikingB.health + "left.\n ")
}

function vikingFigth( vikingA , vikingB) {
  var round = 0;

  if (vikingB.health > 40) {
      attack(vikingA,vikingB)
      setTimeout(function() {vikingFigth( vikingB , vikingA) }, 500);

   }
   else {
      console.log ("Winner under Odin is the Viking " + vikingA.name)
      console.log ("GAME OVER")
     //fonction annuncing the winner
   }

  round ++;
}

function PitFigth( vikingA , vikingB) {
  console.log( vikingA.name + " vs " + vikingB.name );
  vikingFigth( vikingA , vikingB);
}


// PitFigth(viking8, viking2);

// SAXON WAR: Creation village than attack
var Saxon = function(health,strength) {
      this.health = health;
      this.strength =  strength;
};
//
function SaxonsCreator() {
      var numberSaxons = 200 +  Math.round(300 * Math.random());
      var saxonsvillage = [];
      for (var i = 0; i < numberSaxons; i++) {
          var saxons = new Saxon( (Math.round(40 * Math.random())+1) , (Math.round(10 * Math.random())));
          saxonsvillage.push(saxons);
           }
           return saxonsvillage ;
};


function resultVikSax(vikingRandom,index,poorSaxonhealth,indexSaxon) {
    if (poorSaxonhealth <= 0 && vikingRandom.health > 0) {
              console.log ("the Saxon was killed.")
              vikingRandom.score += 1;
              if (saxonsvillage.length > 1) {
                saxonsvillage.splice(indexSaxon, 1);
              } else {
                saxonsvillage = [];
              }
              console.log ("In the village, it remain " + saxonsvillage.length )
    } else  if (poorSaxonhealth > 0 && vikingRandom.health <= 0 ) {
              console.log ("the Viking" + vikingRandom.name + " was killed.")
              if (vikings.length > 1) {
                vikings.splice(index, 1);
              } else {
                vikings = [];
              }
              console.log ("It remain " + vikings.length +" viking(s)")
    } else  if (poorSaxonhealth <= 0 && vikingRandom.health <= 0 ) {
              console.log ("Both the Viking and the Saxon were Killed in a draw.")
              if (saxonsvillage.length > 1) {
                saxonsvillage.splice(indexSaxon, 1);
              } else {
                saxonsvillage = [];
              }
              if (vikings.length > 1) {
                vikings.splice(index, 1);
              } else {
                vikings = [];
              }
              console.log ("It remain " + vikings.length +"\n In the village, it remain " + saxonsvillage.length)
    } else {
      console.log ("Fight not finished")
    }


}

function vikingVsSaxon() {
    var index = (Math.round((vikings.length-1) * Math.random()));
    var indexSaxon = (Math.round((saxonsvillage.length-1) * Math.random()));
    var  vikingRandom = vikings[index]
    var  poorSaxon = saxonsvillage[indexSaxon]
    console.log ("The Brave " + vikingRandom.name + " figths a Saxon.")

    while (vikingRandom.health > 0 && poorSaxon.health > 0 ) {
      var damViking = Math.round(vikingRandom.damagegive()) ;
      var damSaxon = Math.round(poorSaxon.strength * Math.random());
      poorSaxon.health -= damViking;
      vikingRandom.health -= damSaxon ;
      var saxhealth = poorSaxon.health
      resultVikSax(vikingRandom,index,saxhealth,indexSaxon)

    }
      // console.log (vikingRandom.score)
}


function resultsInvasion() {
    if (vikings.length == 0) {
      console.log ("Odin decides to take all our Vikings to the Valhalla.")
    }  else {
      vikings.sort(function(vikA, vikB) {
          return vikB.score - vikA.score;
      });
      for (var i = 0; i < vikings.length; i++) {
        console.log ( vikings[i].name + "\t\t" +  vikings[i].score + "\t\t" + "#".repeat(vikings[i].score) )
      }
      console.log ( vikings[0].name + "is the Greateast Warrior!")
    }


}


function villageAttack() {
      vikings = vikingsHord
      saxonsvillage = SaxonsCreator();
      console.log("Our braves vikings are attacking a Saxon Village with " + saxonsvillage.length + "souls!");
      while ( vikings.length > 0 || saxonsvillage.length > 0  ) {

        vikingVsSaxon();
        console.log("********* vikings :" + vikings.length + " ************ Saxons:" + saxonsvillage.length + "\n")
        if (vikings.length == 0 || saxonsvillage.length == 0 ) {
          console.log ("End of the Invasion")
          break
        }

      };

      resultsInvasion();

}


villageAttack()
