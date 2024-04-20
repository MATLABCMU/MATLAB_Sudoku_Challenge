function [is_true,msg] = VerifyBoard(original,soln)
%VerifyBoard This function verifies the correctness of a given solution

% Verify dimensions
if ~isequal(size(soln),[9,9])
    is_true = false;
    msg = "Incorrect solution dimensions";
    return
end

% Ensure all of original values are still present in the solution
for idx1 = 1:9
    for idx2 = 1:9
        if original(idx1,idx2) ~= 0 && original(idx1,idx2) ~= soln(idx1,idx2)
            is_true = false;
            msg = "Solution modified a given value of the input";
            return
        end
        if soln(idx1,idx2) < 1 || soln(idx1,idx2) > 9
            is_true = false;
            msg = "Solution contains values outside of range 1-9";
            return
        end
    end
end


% Ensure all rows and columns contain no duplicate values
for idx1 = 1:9
    row_val_present = zeros(9,1,'logical');
    col_val_present = zeros(9,1,'logical');
    for idx2 = 1:9
        if row_val_present(soln(idx1,idx2))
            is_true = false;
            msg = "Solution contains more than one " + string(soln(idx1,idx2)) + " in row " + string(idx1);
            return
        else
            row_val_present(soln(idx1,idx2)) = true;
        end

        if col_val_present(soln(idx2,idx1))
            is_true = false;
            msg = "Solution contains more than one " + string(soln(idx2,idx1)) + " in col " + string(idx1);
            return
        else
            col_val_present(soln(idx2,idx1)) = true;
        end
    end
end


% Ensure each of the squares are correct
for idx1 = 1:3
    for idx2 = 1:3
        square_val_present = zeros(9,1,'logical');
        for idx3 = 1:3
            for idx4 = 1:3
                if square_val_present(soln(idx1+idx3,idx2+idx4))
                    is_true = false;
                    msg = "Solution contains more than one " + string(soln(idx1+idx3,idx2+idx4)) + " in big square ("+ string(idx1) + "," + string(idx2) + ")";
                    return
                end
            end
        end
    end
end





is_true = true;
msg = "";

end