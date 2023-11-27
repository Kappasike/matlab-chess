function [black] = is_black(game_status, r, c)
% returns true if the piece at the square is white
     black = game_status(r, c) == 10 || game_status(r, c) < 21 && game_status(r, c) > 15;
end