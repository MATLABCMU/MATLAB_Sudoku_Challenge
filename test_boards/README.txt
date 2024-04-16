
This directory contains test boards for the test bench (files ending with
the ".sudoku" extension). 


Test boards have the following format:
- Files contain an "input" board.
- Boards are 9x9 matrices of numbers.
- Empty squares are represented by the number '0'.
- Full squares are represented by the number (in rance 1-9) in the 
respective square.


Here is an example of a test board:
=============================================
0 0 4 0 5 0 0 0 0
9 0 0 7 3 4 6 0 0
0 0 3 0 2 1 0 4 9
0 3 5 0 9 0 4 8 0
0 9 0 0 0 0 0 3 0
0 7 6 0 1 0 9 2 0
3 1 0 9 7 0 2 0 0
0 0 9 1 8 2 0 0 3
0 0 0 0 6 0 1 0 0
=============================================


In its default configuration, the test bench will attempt to parse all 
'.sudoku' files in the 'test_boards' directory, and solve them using the 
SudokuSolver() function. 

It is your job to implement the SudokuSolver function!


 