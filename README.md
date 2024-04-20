# MATLAB Sudoku Solver Challenge

## Prizes
As we are approaching the end of the semester, anyone who completes the provided and hidden test suite will be guaranteed a prize!

The top 3 fastest finishers will also be given the following prizes:
- First Place: T-Shirt, MATLAB Tote Bag, and MATLAB Stickers
- Second Place: MATLAB Stickers and a choice between a MATLAB Tote Bag and a T-Shirt
- Third Place: MATLAB Stickers, Pop Sockets, and a MATLAB Tote Bag

## Directions
The goal of this challenge is to write a program which solves a 9x9 sudoku board as quickly as possible.

Your job is to implement the SudokuSolver() function in SudokuSolver.m. It takes in a 9x9 matrix containing the sudoku board to be solved, and should output a corresponding solved sudoku board.

The input matrices contain digits 1 through 9 in positions where the input is filled in, and 0 where you should fill in a value.

### Starter Code

In order to test your function, a there is a simple test bench in main.m which runs all of the unit tests in the test_boards directory. More information on the format of the unit tests can be found in test_boards/README.txt.

In order to download the starter code, you can: 
```
git clone https://github.com/MATLABCMU/MATLAB_Sudoku_Challenge.git
```
Or if you don't have git installed, you can download the starter code as a .zip file by clicking on the green '<> code' button at the top of the GitHub page and selecting 'Download Zip'.

### Submission
Once you have a solution you are satisfied with, submit your completed SudokuSolver.m in this [Google Form.](https://forms.gle/SenqjRtaqS77Ne677) Feel free to submit as many times as you want!

### Hardware
The test cases will be run on a 2021 M1 Macbook Pro.

### File Outline

* test_boards: Directory containing all test board files
  * README.txt: Instructions on how to format new test cases
  * {TESTNAME}.sudoku: Sudoku test board files
* main.m: A sample test bench which runs all .sudoku files in the test_boards directory
* SudokuBoard.m: A class describing sudoku board objects
* SudokuSolver.m: A function to be implemented by the contestant which solves a given sudoku board
* TestAllBoards.m: A function which tests the user's solver on all of the boards in the 'test_boards' directory
* TestOneBoard.m: A function which takes in a filename, and tests the user's solver on said file.
* VerifyBoard.m: A function used to verify if the user's solver's solution is a valid one.


## Timeline
* Final submission: Saturday, Apr 27, 11:59 pm.
  * Submit as many times as you want in this [Google Form.](https://forms.gle/SenqjRtaqS77Ne677)
* Results will be announced on Sunday.
* Prize delivery begins on Monday, Apr 29. Further details TBD.

## Contact Me
If you find any issues in the starter code, or have any questions on how to use it, please let me know in the [MATLAB CMU Discord Server](https://discord.gg/aM2RHMug)!

For more news on MATLAB events, make sure to follow [@matlabcmu](https://www.instagram.com/matlabcmu/) on Instagram!