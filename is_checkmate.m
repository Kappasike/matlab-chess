function [is_checkmate] = is_checkmate(game_status, turn)
    % checkmate liberals
    is_checkmate = true;
    % dumb way to do it but check every single move you can make and if
    % you're still in check after every move then it's checkmate
    % check if the person who's turn it currently is can make any moves

    if ~turn % it's white's turn
        for r=1:8
            for c=1:8
                % check if the piece we're currently on is white
                if is_white(game_status, r, c)
                    % if it is white then get all the moves for white
                    legal_squares = get_legal_squares(game_status, r, c);
                    
                    % check every legal move and see if that move would
                    % make us not in check
                    for i=1:size(legal_squares, 1)
                        x = legal_squares(i, 1);
                        y = legal_squares(i, 2);
                        game_status_copy = game_status;
                        game_status_copy(r,c) = 8;
                        game_status_copy(x,y) = game_status(r,c);
                        % if that move would make us not be in check then
                        % there is no checkmate
                        if ~in_check(game_status_copy, turn)
                            is_checkmate = false;
                        end
                    end
                end
            end
        end
    else % it's black's turn
        for r=1:8
            for c=1:8
                % check if the piece we're currently on is white
                if is_black(game_status, r, c)
                    % if it is white then get all the moves for white
                    legal_squares = get_legal_squares(game_status, r, c);
                    
                    % check every legal move and see if that move would
                    % make us not in check
                    for i=1:size(legal_squares, 1)
                        x = legal_squares(i, 1);
                        y = legal_squares(i, 2);
                        game_status_copy = game_status;
                        game_status_copy(r,c) = 8;
                        game_status_copy(x,y) = game_status(r,c);
                        % if that move would make us not be in check then
                        % there is no checkmate
                        if ~in_check(game_status_copy, turn)
                            is_checkmate = false;
                        end
                    end
                end
            end
        end
    end
end