function [final_game_status] = castle(game_status, r, c, x, y, turn, ...
    w_moved, b_moved)

    final_game_status = game_status;
    % if king's already moved shows over
    if (turn && b_moved(3)) || in_check(game_status, turn)
        return;
    end
    if (~turn && w_moved(3)) || in_check(game_status, turn)
        return;
    end

    % test
    if ~turn && r == 8 && c == 5 % white's turn
        if x == 8 && y >= 7 && game_status(8, 6) == 8 && ...
                game_status(8, 7) == 8 && ~w_moved(2)
            game_status_copy = game_status;
            game_status_copy(8,5) = 8;
            game_status_copy(8,6) = 11;
            if in_check(game_status_copy, turn)
                return;
            end
            game_status_copy(8,6) = 8;
            game_status_copy(8,7) = 11;
            if in_check(game_status_copy, turn)
                return;
            end
            % if we've reached this point it's safe to perform the castle
            final_game_status(8,5) = 8;
            final_game_status(8,8) = 8;
            final_game_status(8,7) = 11;
            final_game_status(8,6) = 15;
        elseif x == 8 && y <= 3 && game_status(8, 4) == 8 && ...
                game_status(8, 3) == 8 && game_status(8, 2) == 8 && ~w_moved(1)
            game_status_copy = game_status;
            game_status_copy(8,5) = 8;
            game_status_copy(8,4) = 11;
            if in_check(game_status_copy, turn)
                return;
            end
            game_status_copy(8,4) = 8;
            game_status_copy(8,3) = 11;
            if in_check(game_status_copy, turn)
                return;
            end
            % if we've reached this point it's safe to perform the castle
            final_game_status(8,5) = 8;
            final_game_status(8,1) = 8;
            final_game_status(8,3) = 11;
            final_game_status(8,4) = 15;
        end
    elseif turn && r == 1 && c == 5 % black's turn
        if x == 1 && y >= 7 && game_status(1, 6) == 8 && ...
                game_status(1, 7) == 8 && ~b_moved(2)
            game_status_copy = game_status;
            game_status_copy(1,5) = 8;
            game_status_copy(1,6) = 16;
            if in_check(game_status_copy, turn)
                return;
            end
            game_status_copy(1,6) = 8;
            game_status_copy(1,7) = 16;
            if in_check(game_status_copy, turn)
                return;
            end
            % if we've reached this point it's safe to perform the castle
            final_game_status(1,5) = 8;
            final_game_status(1,8) = 8;
            final_game_status(1,7) = 16;
            final_game_status(1,6) = 20;
        elseif x == 1 && y <= 3 && game_status(1, 4) == 8 && ...
                game_status(1, 3) == 8 && game_status(1, 2) == 8 && ~b_moved(1)
            game_status_copy = game_status;
            game_status_copy(1,5) = 8;
            game_status_copy(1,4) = 16;
            if in_check(game_status_copy, turn)
                return;
            end
            game_status_copy(1,4) = 8;
            game_status_copy(1,3) = 16;
            if in_check(game_status_copy, turn)
                return;
            end
            % if we've reached this point it's safe to perform the castle
            final_game_status(1,5) = 8;
            final_game_status(1,1) = 8;
            final_game_status(1,3) = 11;
            final_game_status(1,4) = 20;
        end
    end
end