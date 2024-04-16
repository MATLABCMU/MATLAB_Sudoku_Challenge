classdef SudokuBoard
    %SudokuBoard This class describes a "board object". Constructing the class parses a board from
    % a file and verifies it is a valid unit test

    %SudokuBoard This class contains a single test board

    properties (GetAccess = public, SetAccess = private)

        % The unsolved input board for this SudokuBoard object
        Input_Board
    end

    methods (Access = public)
        function obj = SudokuBoard(filename)
            obj = obj.parse_sudoku_file(filename);
        end
    end

    methods (Access = private)
        function obj = parse_sudoku_file(obj, filename)
            try
            text = fileread(filename);
            lines = split(text,newline);

            acc_lines = [];
            idx = 0;
            newline_after_start = false;

            for idx = 1:length(lines)
                line = strtrim(lines{idx});

                temp_line = [];
                if isempty(line)
                    newline_after_start=true;
                    break
                end

                line_arr = split(line," ");
                if length(line_arr) ~= 9
                    disp("Failed to parse file " + filename + ": not 9 digits in line")
                    obj.Input_Board = false;
                    return
                end

                for num_idx = 1:length(line_arr)
                    num_str = line_arr{num_idx};

                    num = str2double(num_str);
                    if (num > 9 || num < 0 || isnan(num))
                        disp("Failed to parse file " + filename + ": digits not 0-9")
                        obj.Input_Board = false;
                        return
                    end

                    temp_line = [temp_line, num];
                end
                acc_lines = [acc_lines ; temp_line];
            end

            [valid,msg] = obj.verify_input_board(acc_lines);
            if ~valid
                fprintf("Invalid Input " + filename + ": " + msg + "\n\n");
                obj.Input_Board = false;
                return
            end


            if idx == 9 && ~newline_after_start
                obj.Input_Board = acc_lines;
                return
            end

            if ~(idx == 10 && newline_after_start)
                disp("Failed to parse file " + filename + ": Incorrect row count")
                obj.Input_Board = false;
                return
            end

            while idx < length(lines)
                line = strtrim(lines{idx});
                if ~isempty(line)
                    break
                end
            end

            if idx >= length(lines)
                obj.Input_Board = acc_lines;
                return
            end

            disp("Failed to parse file " + filename + ": Extra characters present after matrix")
            obj.Input_Board = false;
            catch
                disp("Unable to parse file " + filename)
                obj.Input_Board = false;
                return
            end

        end


        function [is_true, msg] = verify_input_board(~,input)

            %VerifyBoard This function verifies the correctness of a given input board

            % Verify dimensions
            if ~isequal(size(input),[9,9])
                is_true = false;
                msg = "Incorrect board dimensions";
                return
            end

            % Ensure all values are within range
            for idx1 = 1:9
                for idx2 = 1:9
                    if input(idx1,idx2) < 0 || input(idx1,idx2) > 9
                        is_true = false;
                        msg = "Board contains values outside of range 1-9";
                        return
                    end
                end
            end


            % Ensure all rows and columns contain no duplicate values
            for idx1 = 1:9
                row_val_present = zeros(9,1,'logical');
                col_val_present = zeros(9,1,'logical');
                for idx2 = 1:9
                    if input(idx1,idx2) ~= 0
                        if row_val_present(input(idx1,idx2))
                            is_true = false;
                            msg = "Board contains more than one " + string(input(idx1,idx2)) + " in row " + string(idx1);
                            return
                        else
                            row_val_present(input(idx1,idx2)) = true;
                        end
                    end

                    if input(idx2,idx1) ~= 0
                        if col_val_present(input(idx2,idx1))
                            is_true = false;
                            msg = "Board contains more than one " + string(input(idx2,idx1)) + " in col " + string(idx1);
                            return
                        else
                            col_val_present(input(idx2,idx1)) = true;
                        end
                    end

                end
            end


            % Ensure each of the squares are correct
            for idx1 = 1:3
                for idx2 = 1:3
                    square_val_present = zeros(9,1,'logical');
                    for idx3 = 1:3
                        for idx4 = 1:3
                            if input(idx1+idx3,idx2+idx4) == 0
                                continue
                            end
                            if square_val_present(input(idx1+idx3,idx2+idx4))
                                is_true = false;
                                msg = "Board contains more than one " + string(input(idx1+idx3,idx2+idx4)) + " in big square ("+ string(idx1) + "," + string(idx2) + ")";
                                return
                            end
                        end
                    end
                end
            end
% TODO automatic indentation

            is_true = true;
            msg = "";
        end

    end
end