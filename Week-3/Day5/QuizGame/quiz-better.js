var Question = function(question,answer,props,id,point) {
      this.question = question;
      this.propositions = props;
      this.answer = answer;
      this.id = id;
      this.point = point ;

};

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
                "1: A quantic particule is also a wave, It has a non-nul probability to be everywhere in the universe. \n 2: Energies of a quantic systems is following a smooth gradient following the Einstein's Law\n   3: Tunel effect tell us that a small probability exist that an electron can cross an obstacle\n    4: The  Schrödinger's cat is at the same time alive and dead in it's box.",
                7, 3
                );
var questions = [q1,q2,q3,q4,q5,q6,q7]

var read = require('read');

var Quizz = function(name) {
    this.name = name ;
    this.questions = questions;
    this.i = 0;
    this.idBonnus = 0;
    this.gamerList = [];
}

Quizz.prototype.bonusQuestion = function() {
    var randomnumber = Math.floor(Math.random()*this.questions.length)
    this.questions[randomnumber].point = this.questions[randomnumber].point  * 3
    this.idBonnus = this.questions[randomnumber].id
}

Quizz.prototype.questionPrompt = function() {
          var text = this.questions[this.i].question + "\n points: " + this.questions[this.i].point + "\n" + this.questions[this.i].propositions + "\n>"
          if (this.questions[this.i].id === this.idBonnus) {
            text = "*".repeat(59) +   "\n********  BONUS QUESTION :  POINT COUNT TRIPLE  *********** \n" + "*".repeat(59) + "\n" + text
          } else { text } return text
        }

Quizz.prototype.PlayQuizz = function(){
          this.bonusQuestion()
          console.log (  " \n\n\n\tScience Quizzzzz\n\n Answer to the Questions by 1, 2, 3 or 4.\n\n You will have 20 secondes to give an answer. \n\n")
          this.QuestionAnswer(this.i)
        }

Quizz.prototype.QuestionAnswer = function(){
          var text = this.questionPrompt(this.i)
          options =  {
              prompt: text ,
              timeout: 20000,
            };
          read(options, this.checkAnswer.bind(this));
        }

Quizz.prototype.checkAnswer = function(err, userAnswer){
          if (userAnswer == this.questions[this.i].answer ) {
            console.log (" Correct! score + " + this.questions[this.i].point + "\n\n\n")
            gamer.score += this.questions[this.i].point
          } else { console.log ("Incorrect\n\n\n") };
          if ( this.i == this.questions.length - 1) {
            console.log("Quizz is over! \ Your score is : " + gamer.score )
            return
          } else { this.i ++ ;
            this.QuestionAnswer() ;
          }
        }


// gamer logic //

var Gamer = function(name = "notCreated") {
  this.name = name ;
  this.score = 0 ;
  this.actualquestion = 0;
  this.answer = "" ;
}

Gamer.prototype.gamerID = function() {
  options =  {
      prompt: "Are you a new user? y / n\n>",
      timeout: 5000,
    };

  read(options, checkAnswer);
  function checkAnswer (err, answer) {
    if (answer == "y") {
          options =  {
            prompt: "Choose a Pseudo.\n>",
            timeout: 5000,
          };
        read(options, checkAnswer);
        function checkAnswer (err, answer) {
          this.name = answer ;
          console.log ("your pseudo is " + this.name);
          // have to check existing pseudo or not
        };
      } else if (answer == "n"){
        options =  {
          prompt: "What is your Pseudo.\n>",
          timeout: 5000,
        };
      read(options, checkAnswer);
      function checkAnswer (err, answer) {
        this.name = answer ;
        console.log ("Welcome back " + this.name);
        // have to check existing pseudo or not
      }
      };
  };
}



gamer = new Gamer()
agamer.gamerID()

// ChemQuiz = new Quizz("CHemistryQuiz");


// ChemQuiz.PlayQuizz()
