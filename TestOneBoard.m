function TestOneBoard(filepath)
% This function tests the board located at the given file path

new_board = SudokuBoard(filepath);

if new_board.Input_Board == false
    return
end

tic
result = SudokuSolver(new_board.Input_Board);
time = toc;

fprintf("\n" + filepath + " completed in " + time + " seconds.\n");



[valid,msg] = VerifyBoard(new_board.Input_Board, result);
if valid
    fprintf("Solves " + filepath + " correctly!\n\n");
else
    fprintf("ERROR: " + filepath + " " + msg + "\n\n");

end