function [is_in_check] = in_check(game_status, turn)

    is_in_check = false;
    % check if the player who's turn it is in check with the current board
    if ~turn % it's white's turn, check if white is in check
        linear_king_index = find(game_status == 11);
        [r, c] = ind2sub(size(game_status), linear_king_index);
        %fprintf("White king is at %d, %d\n", r, c);
        % loop through every piece on the board and if it's a black piece
        % get all legal moves and see if any of them are on the square of
        % the white king
        for x=1:8
            for y=1:8
                % check if the piece we're currently on is black
                if is_black(game_status, x, y)
                    legal_squares = get_legal_squares(game_status, x, y);

                    for i=1:size(legal_squares, 1)
                        % loop through all the legal_moves that this piece
                        % can make and check if that move is where the
                        % white king is
                        if legal_squares(i, 1) == r && legal_squares(i, 2) == c
                            % king is in check
                            is_in_check = true;
                            return;
                        end
                    end
                end
            end
        end
    else % it's black's turn, check if black is in check
        linear_king_index = find(game_status == 16);
        [r, c] = ind2sub(size(game_status), linear_king_index);
        %fprintf("Black king is at %d, %d\n", r, c);
        % loop through every piece on the board and if it's a white piece
        % get all legal moves and see if any of them are on the square of
        % the black king
        for x=1:8
            for y=1:8
                % check if the piece we're currently on is white
                if is_white(game_status, x, y)
                    legal_squares = get_legal_squares(game_status, x, y);

                    for i=1:size(legal_squares, 1)
                        % loop through all the legal_moves that this piece
                        % can make and check if that move is where the
                        % white king is
                        if legal_squares(i, 1) == r && legal_squares(i, 2) == c
                            % king is in check
                            is_in_check = true;
                            return;
                        end
                    end
                end
            end
        end
    end
end