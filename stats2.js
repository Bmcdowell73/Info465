// stats.js
// This program accepts integer input from the user until 'q' or 'Q' is entered.
// It echoes the numbers back and checks if the product of any two equals a third.
// Includes error handling for invalid input and comments to explain the logic.

const readline = require('readline'); // Import readline module to handle user input

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let numbers = []; // Array to store valid integer inputs from the user

// Function to prompt the user for input
function promptUser() {
  rl.question("Enter an integer or q to quit: ", (input) => {

    // Check if user wants to quit (handles both 'q' and 'Q')
    if (input.toLowerCase() === 'q') {
      // Once the user quits, check the product condition
      checkCondition();
      rl.close(); // Close the input interface
      return;
    }

    // Try converting input to an integer
    const number = parseInt(input);

    if (!isNaN(number)) {
      // If input is a valid number, store it
      numbers.push(number);
      promptUser(); // Prompt again
    } else {
      // If input is not a valid number or 'q', show an error
      console.log("Invalid input. Please enter an integer or 'q' to quit.");
      promptUser(); // Prompt again
    }
  });
}

// Function to check if the product of any two numbers equals a third
function checkCondition() {
  if (numbers.length < 3) {
    console.log("Too few numbers entered to check the condition.");
    return;
  }

  // Loop through all unique pairs of numbers
  for (let i = 0; i < numbers.length; i++) {
    for (let j = i + 1; j < numbers.length; j++) {
      const product = numbers[i] * numbers[j];

      // Check if the product exists elsewhere in the list
      for (let k = 0; k < numbers.length; k++) {
        if (k !== i && k !== j && numbers[k] === product) {
          console.log(`Condition is met: ${numbers[i]} x ${numbers[j]} = ${numbers[k]}`);
          return;
        }
      }
    }
  }

  // If no matching condition was found
  console.log("Condition was not met.");
}

// Start the input prompt
promptUser();
