function TestAllBoards()
% This function tests all boards in the test_boards directory

TEST_BOARD_DIR = "test_boards/";

dir_structs = dir (TEST_BOARD_DIR + "*.sudoku");
test_case.Board_List = [];

for file_idx = 1:length(dir_structs)
    if dir_structs(file_idx).isdir
        continue
    end

    TestOneBoard(TEST_BOARD_DIR + dir_structs(file_idx).name)
end


end