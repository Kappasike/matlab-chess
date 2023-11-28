function [legal_squares] = get_legal_squares(game_status, r, c)
    % returns an array of locations the piece can move
    game_piece = game_status(r,c);
    legal_squares = [];
    switch(game_piece)
        % white pawn
        case 9
            if is_inbound(r-1, c) && (game_status(r-1, c) == 8)
                legal_squares = vertcat(legal_squares, [r-1 c]);
            end
            
            % if it's the first move the pawn can move 2 squares
            if is_inbound(r-2, c) && (r == 7 && game_status(r-2, c) == 8)
                legal_squares = vertcat(legal_squares, [r-2 c]);
            end
            
            % check if you can take a piece on right
            if is_inbound(r-1, c+1) && is_black(game_status, r-1, c+1)
                legal_squares = vertcat(legal_squares, [r-1 c+1]);
            end

            % check if you can take a piece on left
            if is_inbound(r-1, c-1) && is_black(game_status, r-1, c-1)
                legal_squares = vertcat(legal_squares, [r-1 c-1]);
            end

        % black pawn 
        case 10
            if is_inbound(r+1, c) && (game_status(r+1, c) == 8)
                legal_squares = vertcat(legal_squares, [r+1 c]);
            end
            % if it's the first move the pawn can move 2 squares
            if is_inbound(r+2, c) && (r == 2 && game_status(r+2, c) == 8)
                legal_squares = vertcat(legal_squares, [r+2 c]);
            end
            
            % check if you can take a piece on right
            if is_inbound(r+1, c+1) && is_white(game_status, r+1, c+1)
                legal_squares = vertcat(legal_squares, [r+1 c+1]);
            end

            % check if you can take a piece on left
            if is_inbound(r+1, c-1) && is_white(game_status, r+1, c-1)
                legal_squares = vertcat(legal_squares, [r+1 c-1]);
            end

       % white knight
        case 14            
            if is_inbound(r-2, c+1) && (game_status(r-2, c+1) == 8 || is_black(game_status, r-2, c+1))
                legal_squares = vertcat(legal_squares, [r-2 c+1]);
            end
            if is_inbound(r-2, c-1) && (game_status(r-2, c-1) == 8 || is_black(game_status, r-2, c-1))
                legal_squares = vertcat(legal_squares, [r-2 c-1]);
            end
            if is_inbound(r-1, c+2) && (game_status(r-1, c+2) == 8 || is_black(game_status, r-1, c+2))
                legal_squares = vertcat(legal_squares, [r-1 c+2]);
            end
            if is_inbound(r-2, c-2) && (game_status(r-1, c-2) == 8 || is_black(game_status, r-1, c-2))
                legal_squares = vertcat(legal_squares, [r-1 c-2]);
            end
            if is_inbound(r+2, c+1) && (game_status(r+2, c+1) == 8 || is_black(game_status, r+2, c+1))
                legal_squares = vertcat(legal_squares, [r+2 c+1]);
            end
            if is_inbound(r+2, c-1) && (game_status(r+2, c-1) == 8 || is_black(game_status, r+2, c-1))
                legal_squares = vertcat(legal_squares, [r+2 c-1]);
            end
            if is_inbound(r+1, c+2) && (game_status(r+1, c+2) == 8 || is_black(game_status, r+1, c+2))
                legal_squares = vertcat(legal_squares, [r+1 c+2]);
            end
            if is_inbound(r+1, c-2) && (game_status(r+1, c-2) == 8 || is_black(game_status, r+1, c-2))
                legal_squares = vertcat(legal_squares, [r+1 c-2]);
            end
        % black knight
        case 19
            if is_inbound(r-2, c+1) && (game_status(r-2, c+1) == 8 || is_white(game_status, r-2, c+1))
                legal_squares = vertcat(legal_squares, [r-2 c+1]);
            end
            if is_inbound(r-2, c-1) && (game_status(r-2, c-1) == 8 || is_white(game_status, r-2, c-1))
                legal_squares = vertcat(legal_squares, [r-2 c-1]);
            end
            if is_inbound(r-1, c+2) && (game_status(r-1, c+2) == 8 || is_white(game_status, r-1, c+2))
                legal_squares = vertcat(legal_squares, [r-1 c+2]);
            end
            if is_inbound(r-2, c-2) && (game_status(r-1, c-2) == 8 || is_white(game_status, r-1, c-2))
                legal_squares = vertcat(legal_squares, [r-1 c-2]);
            end
            if is_inbound(r+2, c+1) && (game_status(r+2, c+1) == 8 || is_white(game_status, r+2, c+1))
                legal_squares = vertcat(legal_squares, [r+2 c+1]);
            end
            if is_inbound(r+2, c-1) && (game_status(r+2, c-1) == 8 || is_white(game_status, r+2, c-1))
                legal_squares = vertcat(legal_squares, [r+2 c-1]);
            end
            if is_inbound(r+1, c+2) && (game_status(r+1, c+2) == 8 || is_white(game_status, r+1, c+2))
                legal_squares = vertcat(legal_squares, [r+1 c+2]);
            end
            if is_inbound(r+1, c-2) && (game_status(r+1, c-2) == 8 || is_white(game_status, r+1, c-2))
                legal_squares = vertcat(legal_squares, [r+1 c-2]);
            end

        % white bishop
        case 13
            % loop until i go out of bounds or hit an enemy piece
            % up and left
            i=1;
            while is_inbound(r-i, c-i)
                if is_white(game_status, r-i, c-i)
                    break;
                end
                if is_black(game_status, r-i, c-i)
                    legal_squares = vertcat(legal_squares, [r-i c-i]);
                    break;
                end
                if game_status(r-i, c-i) == 8
                    legal_squares = vertcat(legal_squares, [r-i c-i]);
                end
                i=i+1;
            end

            % down and right
            i=1;
            while is_inbound(r+i, c+i)
                if is_white(game_status, r+i, c+i)
                    break;
                end
                if is_black(game_status, r+i, c+i)
                    legal_squares = vertcat(legal_squares, [r+i c+i]);
                    break;
                end
                if game_status(r+i, c+i) == 8
                    legal_squares = vertcat(legal_squares, [r+i c+i]);
                end
                i=i+1;
            end

            % up and right
            i=1;
            while is_inbound(r-i, c+i)
                if is_white(game_status, r-i, c+i)
                    break;
                end
                if is_black(game_status, r-i, c+i)
                    legal_squares = vertcat(legal_squares, [r-i c+i]);
                    break;
                end
                if game_status(r-i, c+i) == 8
                    legal_squares = vertcat(legal_squares, [r-i c+i]);
                end
                i=i+1;
            end

            % down and left
            i=1;
            while is_inbound(r+i, c-i)
                if is_white(game_status, r+i, c-i)
                    break;
                end
                if is_black(game_status, r+i, c-i)
                    legal_squares = vertcat(legal_squares, [r+i c-i]);
                    break;
                end
                if game_status(r+i, c-i) == 8
                    legal_squares = vertcat(legal_squares, [r+i c-i]);
                end
                i=i+1;
            end
        % black bishop
        case 18
                % loop until i go out of bounds or hit an enemy piece
            % up and left
            i=1;
            while is_inbound(r-i, c-i)
                if is_black(game_status, r-i, c-i)
                    break;
                end
                if is_white(game_status, r-i, c-i)
                    legal_squares = vertcat(legal_squares, [r-i c-i]);
                    break;
                end
                if game_status(r-i, c-i) == 8
                    legal_squares = vertcat(legal_squares, [r-i c-i]);
                end
                i=i+1;
            end

            % down and right
            i=1;
            while is_inbound(r+i, c+i)
                if is_black(game_status, r+i, c+i)
                    break;
                end
                if is_white(game_status, r+i, c+i)
                    legal_squares = vertcat(legal_squares, [r+i c+i]);
                    break;
                end
                if game_status(r+i, c+i) == 8
                    legal_squares = vertcat(legal_squares, [r+i c+i]);
                end
                i=i+1;
            end

            % up and right
            i=1;
            while is_inbound(r-i, c+i)
                if is_black(game_status, r-i, c+i)
                    break;
                end
                if is_white(game_status, r-i, c+i)
                    legal_squares = vertcat(legal_squares, [r-i c+i]);
                    break;
                end
                if game_status(r-i, c+i) == 8
                    legal_squares = vertcat(legal_squares, [r-i c+i]);
                end
                i=i+1;
            end

            % down and left
            i=1;
            while is_inbound(r+i, c-i)
                if is_black(game_status, r+i, c-i)
                    break;
                end
                if is_white(game_status, r+i, c-i)
                    legal_squares = vertcat(legal_squares, [r+i c-i]);
                    break;
                end
                if game_status(r+i, c-i) == 8
                    legal_squares = vertcat(legal_squares, [r+i c-i]);
                end
                i=i+1;
            end

        % white rook
        case 15
            % right
            i=1;
            while is_inbound(r, c-i)
                if is_white(game_status, r, c-i)
                    break;
                end
                if is_black(game_status, r, c-i)
                    legal_squares = vertcat(legal_squares, [r c-i]);
                    break;
                end
                if game_status(r, c-i) == 8
                    legal_squares = vertcat(legal_squares, [r c-i]);
                end
                i=i+1;
            end
            % left
            i=1;
            while is_inbound(r, c+i)
                if is_white(game_status, r, c+i)
                    break;
                end
                if is_black(game_status, r, c+i)
                    legal_squares = vertcat(legal_squares, [r c+i]);
                    break;
                end
                if game_status(r, c+i) == 8
                    legal_squares = vertcat(legal_squares, [r c+i]);
                end
                i=i+1;
            end
            % up
            i=1;
            while is_inbound(r-i, c)
                if is_white(game_status, r-i, c)
                    break;
                end
                if is_black(game_status, r-i, c)
                    legal_squares = vertcat(legal_squares, [r-i c]);
                    break;
                end
                if game_status(r-i, c) == 8
                    legal_squares = vertcat(legal_squares, [r-i c]);
                end
                i=i+1;
            end
            % down
            i=1;
            while is_inbound(r+i, c)
                if is_white(game_status, r+i, c)
                    break;
                end
                if is_black(game_status, r+i, c)
                    legal_squares = vertcat(legal_squares, [r+i c]);
                    break;
                end
                if game_status(r+i, c) == 8
                    legal_squares = vertcat(legal_squares, [r+i c]);
                end
                i=i+1;
            end
        % black rook
        case 20
            % right
            i=1;
            while is_inbound(r, c-i)
                if is_black(game_status, r, c-i)
                    break;
                end
                if is_white(game_status, r, c-i)
                    legal_squares = vertcat(legal_squares, [r c-i]);
                    break;
                end
                if game_status(r, c-i) == 8
                    legal_squares = vertcat(legal_squares, [r c-i]);
                end
                i=i+1;
            end
            % left
            i=1;
            while is_inbound(r, c+i)
                if is_black(game_status, r, c+i)
                    break;
                end
                if is_white(game_status, r, c+i)
                    legal_squares = vertcat(legal_squares, [r c+i]);
                    break;
                end
                if game_status(r, c+i) == 8
                    legal_squares = vertcat(legal_squares, [r c+i]);
                end
                i=i+1;
            end
            % up
            i=1;
            while is_inbound(r-i, c)
                if is_black(game_status, r-i, c)
                    break;
                end
                if is_white(game_status, r-i, c)
                    legal_squares = vertcat(legal_squares, [r-i c]);
                    break;
                end
                if game_status(r-i, c) == 8
                    legal_squares = vertcat(legal_squares, [r-i c]);
                end
                i=i+1;
            end
            % down
            i=1;
            while is_inbound(r+i, c)
                if is_black(game_status, r+i, c)
                    break;
                end
                if is_white(game_status, r+i, c)
                    legal_squares = vertcat(legal_squares, [r+i c]);
                    break;
                end
                if game_status(r+i, c) == 8
                    legal_squares = vertcat(legal_squares, [r+i c]);
                end
                i=i+1;
            end
        % white queen
        case 12
            % right
            i=1;
            while is_inbound(r, c-i)
                if is_white(game_status, r, c-i)
                    break;
                end
                if is_black(game_status, r, c-i)
                    legal_squares = vertcat(legal_squares, [r c-i]);
                    break;
                end
                if game_status(r, c-i) == 8
                    legal_squares = vertcat(legal_squares, [r c-i]);
                end
                i=i+1;
            end
            % left
            i=1;
            while is_inbound(r, c+i)
                if is_white(game_status, r, c+i)
                    break;
                end
                if is_black(game_status, r, c+i)
                    legal_squares = vertcat(legal_squares, [r c+i]);
                    break;
                end
                if game_status(r, c+i) == 8
                    legal_squares = vertcat(legal_squares, [r c+i]);
                end
                i=i+1;
            end
            % up
            i=1;
            while is_inbound(r-i, c)
                if is_white(game_status, r-i, c)
                    break;
                end
                if is_black(game_status, r-i, c)
                    legal_squares = vertcat(legal_squares, [r-i c]);
                    break;
                end
                if game_status(r-i, c) == 8
                    legal_squares = vertcat(legal_squares, [r-i c]);
                end
                i=i+1;
            end
            % down
            i=1;
            while is_inbound(r+i, c)
                if is_white(game_status, r+i, c)
                    break;
                end
                if is_black(game_status, r+i, c)
                    legal_squares = vertcat(legal_squares, [r+i c]);
                    break;
                end
                if game_status(r+i, c) == 8
                    legal_squares = vertcat(legal_squares, [r+i c]);
                end
                i=i+1;
            end
            i=1;
            while is_inbound(r-i, c-i)
                if is_white(game_status, r-i, c-i)
                    break;
                end
                if is_black(game_status, r-i, c-i)
                    legal_squares = vertcat(legal_squares, [r-i c-i]);
                    break;
                end
                if game_status(r-i, c-i) == 8
                    legal_squares = vertcat(legal_squares, [r-i c-i]);
                end
                i=i+1;
            end

            % down and right
            i=1;
            while is_inbound(r+i, c+i)
                if is_white(game_status, r+i, c+i)
                    break;
                end
                if is_black(game_status, r+i, c+i)
                    legal_squares = vertcat(legal_squares, [r+i c+i]);
                    break;
                end
                if game_status(r+i, c+i) == 8
                    legal_squares = vertcat(legal_squares, [r+i c+i]);
                end
                i=i+1;
            end

            % up and right
            i=1;
            while is_inbound(r-i, c+i)
                if is_white(game_status, r-i, c+i)
                    break;
                end
                if is_black(game_status, r-i, c+i)
                    legal_squares = vertcat(legal_squares, [r-i c+i]);
                    break;
                end
                if game_status(r-i, c+i) == 8
                    legal_squares = vertcat(legal_squares, [r-i c+i]);
                end
                i=i+1;
            end

            % down and left
            i=1;
            while is_inbound(r+i, c-i)
                if is_white(game_status, r+i, c-i)
                    break;
                end
                if is_black(game_status, r+i, c-i)
                    legal_squares = vertcat(legal_squares, [r+i c-i]);
                    break;
                end
                if game_status(r+i, c-i) == 8
                    legal_squares = vertcat(legal_squares, [r+i c-i]);
                end
                i=i+1;
            end
        % black queen
        case 17
            % right
            i=1;
            while is_inbound(r, c-i)
                if is_black(game_status, r, c-i)
                    break;
                end
                if is_white(game_status, r, c-i)
                    legal_squares = vertcat(legal_squares, [r c-i]);
                    break;
                end
                if game_status(r, c-i) == 8
                    legal_squares = vertcat(legal_squares, [r c-i]);
                end
                i=i+1;
            end
            % left
            i=1;
            while is_inbound(r, c+i)
                if is_black(game_status, r, c+i)
                    break;
                end
                if is_white(game_status, r, c+i)
                    legal_squares = vertcat(legal_squares, [r c+i]);
                    break;
                end
                if game_status(r, c+i) == 8
                    legal_squares = vertcat(legal_squares, [r c+i]);
                end
                i=i+1;
            end
            % up
            i=1;
            while is_inbound(r-i, c)
                if is_black(game_status, r-i, c)
                    break;
                end
                if is_white(game_status, r-i, c)
                    legal_squares = vertcat(legal_squares, [r-i c]);
                    break;
                end
                if game_status(r-i, c) == 8
                    legal_squares = vertcat(legal_squares, [r-i c]);
                end
                i=i+1;
            end
            % down
            i=1;
            while is_inbound(r+i, c)
                if is_black(game_status, r+i, c)
                    break;
                end
                if is_white(game_status, r+i, c)
                    legal_squares = vertcat(legal_squares, [r+i c]);
                    break;
                end
                if game_status(r+i, c) == 8
                    legal_squares = vertcat(legal_squares, [r+i c]);
                end
                i=i+1;
            end

            i=1;
            while is_inbound(r-i, c-i)
                if is_black(game_status, r-i, c-i)
                    break;
                end
                if is_white(game_status, r-i, c-i)
                    legal_squares = vertcat(legal_squares, [r-i c-i]);
                    break;
                end
                if game_status(r-i, c-i) == 8
                    legal_squares = vertcat(legal_squares, [r-i c-i]);
                end
                i=i+1;
            end

            % down and right
            i=1;
            while is_inbound(r+i, c+i)
                if is_black(game_status, r+i, c+i)
                    break;
                end
                if is_white(game_status, r+i, c+i)
                    legal_squares = vertcat(legal_squares, [r+i c+i]);
                    break;
                end
                if game_status(r+i, c+i) == 8
                    legal_squares = vertcat(legal_squares, [r+i c+i]);
                end
                i=i+1;
            end

            % up and right
            i=1;
            while is_inbound(r-i, c+i)
                if is_black(game_status, r-i, c+i)
                    break;
                end
                if is_white(game_status, r-i, c+i)
                    legal_squares = vertcat(legal_squares, [r-i c+i]);
                    break;
                end
                if game_status(r-i, c+i) == 8
                    legal_squares = vertcat(legal_squares, [r-i c+i]);
                end
                i=i+1;
            end

            % down and left
            i=1;
            while is_inbound(r+i, c-i)
                if is_black(game_status, r+i, c-i)
                    break;
                end
                if is_white(game_status, r+i, c-i)
                    legal_squares = vertcat(legal_squares, [r+i c-i]);
                    break;
                end
                if game_status(r+i, c-i) == 8
                    legal_squares = vertcat(legal_squares, [r+i c-i]);
                end
                i=i+1;
            end

        % white king 
        case 11
            if is_inbound(r-1, c-1) && (game_status(r-1, c-1) == 8 || is_black(game_status, r-1, c-1))
                legal_squares = vertcat(legal_squares, [r-1 c-1]);
            end
            if is_inbound(r, c-1) && (game_status(r, c-1) == 8 || is_black(game_status, r, c-1))
                legal_squares = vertcat(legal_squares, [r c-1]);
            end
            if is_inbound(r+1, c-1) && (game_status(r+1, c-1) == 8 || is_black(game_status, r+1, c-1))
                legal_squares = vertcat(legal_squares, [r+1 c-1]);
            end
            if is_inbound(r+1, c) && (game_status(r+1, c) == 8 || is_black(game_status, r+1, c))
                legal_squares = vertcat(legal_squares, [r+1 c]);
            end

            if is_inbound(r+1, c+1) && (game_status(r+1, c+1) == 8 || is_black(game_status, r+1, c+1))
                legal_squares = vertcat(legal_squares, [r+1 c+1]);
            end

            if is_inbound(r, c+1) && (game_status(r, c+1) == 8 || is_black(game_status, r, c+1))
                legal_squares = vertcat(legal_squares, [r c+1]);
            end

            if is_inbound(r-1, c+1) && (game_status(r-1, c+1) == 8 || is_black(game_status, r-1, c+1))
                legal_squares = vertcat(legal_squares, [r-1 c+1]);
            end

            if is_inbound(r-1, c) && (game_status(r-1, c) == 8 || is_black(game_status, r-1, c))
                legal_squares = vertcat(legal_squares, [r-1 c]);
            end
        % black king
        case 16
            if is_inbound(r-1, c-1) && (game_status(r-1, c-1) == 8 || is_white(game_status, r-1, c-1))
                legal_squares = vertcat(legal_squares, [r-1 c-1]);
            end
            if is_inbound(r, c-1) && (game_status(r, c-1) == 8 || is_white(game_status, r, c-1))
                legal_squares = vertcat(legal_squares, [r c-1]);
            end
            if is_inbound(r+1, c-1) && (game_status(r+1, c-1) == 8 || is_white(game_status, r+1, c-1))
                legal_squares = vertcat(legal_squares, [r+1 c-1]);
            end
            if is_inbound(r+1, c) && (game_status(r+1, c) == 8 || is_white(game_status, r+1, c))
                legal_squares = vertcat(legal_squares, [r+1 c]);
            end

            if is_inbound(r+1, c+1) && (game_status(r+1, c+1) == 8 || is_white(game_status, r+1, c+1))
                legal_squares = vertcat(legal_squares, [r+1 c+1]);
            end

            if is_inbound(r, c+1) && (game_status(r, c+1) == 8 || is_white(game_status, r, c+1))
                legal_squares = vertcat(legal_squares, [r c+1]);
            end

            if is_inbound(r-1, c+1) && (game_status(r-1, c+1) == 8 || is_white(game_status, r-1, c+1))
                legal_squares = vertcat(legal_squares, [r-1 c+1]);
            end

            if is_inbound(r-1, c) && (game_status(r-1, c) == 8 || is_white(game_status, r-1, c))
                legal_squares = vertcat(legal_squares, [r-1 c]);
            end
        % think that's it, might add castling but idk

    end

end