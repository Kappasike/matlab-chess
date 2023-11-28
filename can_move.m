function [can_move] = can_move(game_status, r, c, x, y, turn)
    % checks if the move requested can be made
    can_move = false;
    % get array of legal moves
    legal_squares = get_legal_squares(game_status, r, c);
    for i=1:size(legal_squares, 1)
        if legal_squares(i, 1) == x && legal_squares(i, 2) == y
            % creates copy not reference, pretty big matlab moment but
            % useful for this
            game_status_copy = game_status;
            game_status_copy(r,c) = 8;
            game_status_copy(x,y) = game_status(r,c);
            % if that move would make us be in check then don't allow it
            if ~in_check(game_status_copy, turn)
                can_move = true;
            end
        end
    end
end