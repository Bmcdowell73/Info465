// stats.js - Calculate mean and median from user input in Node.js
// The program reads a list of integers from the user, handles invalid input,
// calculates mean and median, and prints the results to the console.

const readline = require('readline'); // Import readline to handle user input

// Create a readline interface for input/output
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let numbers = []; // This array will store all valid integers entered by the user

// Function to repeatedly prompt the user for input
function askNumber() {
  rl.question("Enter an integer (or 'q' to quit): ", (input) => {
    // Allow the user to quit the program
    if (input.toLowerCase() === 'q') {
      if (numbers.length === 0) {
        console.log("No numbers entered. Exiting.");
        rl.close();
        return;
      }
      displayResults(); // Show results once input is complete
      rl.close();
    } else {
      // Check if the input is a valid single integer using regex
      if (/^-?\d+$/.test(input.trim())) {
        numbers.push(parseInt(input));
      } else {
        // Handle bad input (e.g., letters, symbols, multiple numbers)
        console.log("Invalid input. Please enter a single integer.");
      }
      askNumber(); // Prompt again
    }
  });
}

// Function to calculate and display mean and median
function displayResults() {
  console.log(`\nNumbers entered: ${numbers.join(', ')}`);

  // Calculate mean (average)
  const mean = numbers.reduce((sum, num) => sum + num, 0) / numbers.length;

  // Sort numbers to prepare for median calculation
  const sorted = [...numbers].sort((a, b) => a - b);
  const mid = Math.floor(sorted.length / 2);
  
  // Calculate median based on even/odd count
  const median = (sorted.length % 2 === 0)
    ? (sorted[mid - 1] + sorted[mid]) / 2
    : sorted[mid];

  // Print results
  console.log(`Mean: ${mean.toFixed(2)}`);
  console.log(`Median: ${median}`);
}

// Start the program
askNumber();
