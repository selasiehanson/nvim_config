const {pipe } = require("./test-libs/functional.js");

const person = {
  name: "Peter",
  age : 19,
  address: {
    street: "some cool stree on the block"
  }
}


function add(a, b) {
  return a + b;
}

function mult(a, b) {
  return a  * b;
}

function greet(person){
  console.log("hi " + person.name);
}
console.log("2 + 5 is ", add(2,5));
console.log("2 * 5 is ", mult(2,5));
console.log("2 * 5 is ", mult(2,5));
greet (person);

const id = (x) => x;

pipe(
  id(3),
  (x) => x + 1,
  (x) => x * x,
  console.log
)

pipe(
  id(person),
  console.log
)
