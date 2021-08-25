// callback function testing (works)
/*
function primaryFunction(name, number, purpose, callback){
    var licenseAndRegistration = name + " " + number + " ";
    if (typeof callback === "function") {
        callback(licenseAndRegistration, purpose);
    }
}

function tagFunction(tagIntro) {
    console.log(tagIntro + "tags are durable and highly rated across all fields and alert individuals to danger");
}

function stripedOrPlain(name, striped){
    var designation = striped && striped === "Striped Danger" ? "Lockout Tagout tags" : "Danger tags";
    console.log(name + "are " + designation + " that are designed to warn individuals");
}

primaryFunction("Striped Danger", "PTG5000", "Striped Danger", stripedOrPlain) 
*/

//-----------------------------------------------------------------------------------------

//cannot use inquirer since firewall won't allow npm installations (untested)
/*
const inquirer = require(inquirer)

var questions = [
    {
        type: "input",
        name: "name",
        message: "First and Last name?"
    }
]

inquirer.prompt(questions).then(answers => {
    console.log("Hello,  ${answers['name']}!")
})*/

//IIFE (immediately invoked function expression) (works)
/*
(function (name) {console.log(name)}) ("Richard") 
*/

//---------------------------------------------------------------------------------------
//Prototyping
/*

function TurtleTime(species, time){
    this.species = "Teenage Mutant Ninja Turtles";
    this.time = "Turtle Time";
}

TurtleTime.prototype.intro = function(){
    console.log("Hey I'm " + this.name + " one of the " + this.species + " and it's " + 
    this.time + ", " + this.catchprase)
}

function WarCry (name, catchprase){
    this.name = name
    this.catchprase = catchprase
}

WarCry.prototype = new TurtleTime

var donatello = new WarCry("Donatello", "Cowabunga!")

donatello.intro()

*/
//----------------------------------------------------------------------------------------
//fizzbuzz question
/*
function fizzbuzz() {
    for (var count = 0; count < 101; count++){
        if (count % 3 === 0 && count % 5 === 0){
            console.log("PINGPONG")
        } else if (count % 5 === 0) {
            console.log("pong")
        } else if (count % 3 === 0) {
            console.log("ping")
        } else 
        console.log(count)
    }
}
fizzbuzz()
*/
//-----------------------------------------------------------------------------------------
//Recursion
/*
//context: you have recurring nightmares for one week at a time and then one week free 
function recurringNightmare(night){
    if (night < 1){
        console.log("sleep tight")
    } else {
        console.log(night + " more nightmares to go")
        recurringNightmare(night-1)
        console.log("day " + night + " of no nightmares")
        return
    }
}
recurringNightmare(7)
*/
//------------------------------------------------------------------------------------------
//Tower of Hanoi (advanced recursion)
/*
function towerOfHanoi (n, from_rod, to_rod, aux_rod){
    if(n == 1){
        console.log("Move disk 1 from rod " + from_rod + " to rod " + to_rod);
        return;
    }
    towerOfHanoi(n - 1, from_rod, aux_rod, to_rod);
    console.log("Move disk " + n + " from rod " + from_rod + " to rod " + to_rod);
    towerOfHanoi(n - 1, aux_rod, to_rod, from_rod);
}

var n = 3;
towerOfHanoi(n, 'A', 'C', 'B')
*/
//-----------------------------------------------------------------------------------------
