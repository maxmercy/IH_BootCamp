var Question = function(question,answer,props,ID,point) {
      this.question = question;
      this.propositions = props;
      this.answer = answer;
      this.ID = ID;
      this.point = point ;

};



var Gamer = function(name) {
  this.name = name ;
  this.score = 0
}



var q1 = new Question('What is the chemical formula of the Water molecule?',
                      '2',
                      "1: CH4  ,   2: H2O    ,    3: CH3-CH2-OH    ,   4: Evian?",
                      1 , 1);

var q2 = new Question('How many electrons in a Hydrogen (H) atom?',
                      '1',
                      "1    ,    2    ,   3    ,    Ask to Orestron",
                      2, 2);

var q3 = new Question('What is the chemical symbol for the element Gold?',
                      '3',
                      '1: Or   ,    2: Gd   ,    3: Au   ,   4: €€    ',
                      3, 1);

var q4 = new Question('In the famous E=mc² of Albert Einstein, what the "c" stand for?',
                  '1',
                  '1: celerity   ,    2: critical   ,    3: circle   ,    4: Céline Dion    ',
                  4, 2);

var q5 = new Question('One of the essential minerals in the human body is salt. How much salt (NaCl) is in the average adult human body?',
                  '3',
                  '1: 1kG   ,    2: 500 grams   ,    3: 250 grams   ,    4: pratically none    ',
                  5, 2);

var q6 = new Question("You can't live without iron. Where in the body is most of the iron located? your:",
                  '2',
                  "1: brain   ,    2: blood   ,    3: bones   ,    4: Popeye's Biceps ",
                  6, 1
                    );

var q7 = new Question("Wich of this affirmation on Quantum Physics is not true ",
                '2',
                ['1: A quantic particule is also a wave, It has a non-nul probability to be everywhere in the universe. \n',
                 "2: Energies of a quantic systems is following a smooth gradient following the Einstein's Law\n",
                 '3: Tunel effect tell us that a small probability exist that an electron can cross an obstacle\n',
                 "4: The  Schrödinger's cat is at the same time alive and dead in it's box."],
                7, 5
                );

var questions = [q1,q2,q3,q4,q5,q6,q7]

var read = require('read');


// function gamerCreation() {
//     var name = ""
//     options =  {
//         prompt: "What's your name? (you have 4secondes)\n>",
//         timeout: 4000,
//       };
//
//     read(options, createGamer );
//     function createGamer (err, name,isDefault){
//       if (name === undefined) { name = 'IronHacker'};
//       console.log("Welcome " + name);
//       var name = new Gamer(name);
//       console.log(name);
//     };
// }
// gamerCreation()

var gamer = new Gamer("IronHacker");

function questionPrompt(i) {
return questions[i].question + "\n points: " + questions[i].point + "\n" + questions[i].propositions + "\n>"
}

function QuestionAnswer(i){
  // console.log (questions[i].question);
  var text = questionPrompt(i)

  options =  {
      prompt: text ,
      timeout: 20000,
    };
  read(options, checkAnswer );


  function checkAnswer (err, userAnswer){
      if (userAnswer == questions[i].answer ) {
        console.log (" Correct! score + " + questions[i].point)
        gamer.score += questions[i].point
      } else {
          console.log ("Incorrect")
      };

      if ( i == questions.length - 1) {
        console.log("Quizz is over! \ Your score is : " + gamer.score )
        return
      } else {
      i ++
      QuestionAnswer(i)
    }
  }
}








function Quizz(){

    console.log ("  \tScience Quizzzzz\n Answer to the Questions by 1, 2, 3 or 4.\n You will have 20 secondes to give an answer. \n")
    var i = 0;
    QuestionAnswer(i)


}

Quizz()
