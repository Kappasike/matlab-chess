function [eval] = evaluate_board(game_status)
    eval = 0;
    
    for r=1:8
        for c=1:8
            [h, w] = size(game_status);
            if h<1 || h>8 || w<1 || w>8
                game_status
            end
            current_piece = game_status(r,c);
            switch(current_piece)
                case 9      % white pawn
                    eval = eval + 1;
                case 14     % white knight
                    eval = eval + 3;
                case 13     % white bishop
                    eval = eval + 3;
                case 15     % white rook
                    eval = eval + 5;
                case 12     % white queen
                    eval = eval + 9;
                case 11     % white king
                    eval = eval + 80;
                case 10     % black pawn
                    eval = eval - 1;
                case 19     % black knight
                    eval = eval - 3;
                case 18     % black bishop
                    eval = eval - 3;
                case 20     % black rook
                    eval = eval - 5;
                case 17     % black queen
                    eval = eval - 9;
                case 16     % black king
                    eval = eval - 80;
            end
        end
    end
end