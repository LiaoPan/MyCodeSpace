'use strict';


var name;
function greet(name){
	console.log("Hello world "+name);
}

function eat(){
	console.log("Hello eat something");
}

module.exports = {
	greet:greet,
	eat:eat
};