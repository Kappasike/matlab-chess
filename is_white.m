function [white] = is_white(game_status, r, c)
% returns true if the piece at the square is white
    white = game_status(r, c) ~= 10 && game_status(r, c) < 16 && game_status(r, c) > 8;
end