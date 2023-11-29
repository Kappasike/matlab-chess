function [legal_positions] = get_bot_positions(game_status, turn)
    % returns an array of locations the piece can move
    legal_positions = [];
    for r=1:8
        for c=1:8
            game_piece = game_status(r,c);
            
            if turn
            switch(game_piece)
                % black pawn 
                case 10
                    if is_inbound(r+1, c) && (game_status(r+1, c) == 8)
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+1, c) = 10;
                        if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    % if it's the first move the pawn can move 2 squares
                    if is_inbound(r+2, c) && (r == 2 && game_status(r+2, c) == 8)
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+2, c) = 10;
                        if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    
                    % check if you can take a piece on right
                    if is_inbound(r+1, c+1) && is_white(game_status, r+1, c+1)
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+1, c+1) = 10;
                        if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
        
                    % check if you can take a piece on left
                    if is_inbound(r+1, c-1) && is_white(game_status, r+1, c-1)
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+1, c-1) = 10;
                        if ~in_check(new_game_status, 1)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
        
                % black knight
                case 19
                    if is_inbound(r-2, c+1) && (game_status(r-2, c+1) == 8 || is_white(game_status, r-2, c+1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r-2, c+1) = 19;
                        if ~in_check(new_game_status, 1)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r-2, c-1) && (game_status(r-2, c-1) == 8 || is_white(game_status, r-2, c-1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r-2, c-1) = 19;
                        if ~in_check(new_game_status, 1)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r-1, c+2) && (game_status(r-1, c+2) == 8 || is_white(game_status, r-1, c+2))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r-1, c+2) = 19;
                        if ~in_check(new_game_status, 1)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r-2, c-2) && (game_status(r-1, c-2) == 8 || is_white(game_status, r-1, c-2))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r-2, c-2) = 19;
                        if ~in_check(new_game_status, 1)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r+2, c+1) && (game_status(r+2, c+1) == 8 || is_white(game_status, r+2, c+1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+2, c+1) = 19;
                        if ~in_check(new_game_status, 1)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r+2, c-1) && (game_status(r+2, c-1) == 8 || is_white(game_status, r+2, c-1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+2, c-1) = 19;
                        if ~in_check(new_game_status, 1)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r+1, c+2) && (game_status(r+1, c+2) == 8 || is_white(game_status, r+1, c+2))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+1, c+2) = 19;
                        if ~in_check(new_game_status, 1)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r+1, c-2) && (game_status(r+1, c-2) == 8 || is_white(game_status, r+1, c-2))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+1, c-2) = 19;
                        if ~in_check(new_game_status, 1)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
        
                % black bishop
                case 18
                        % loop until i go out of bounds or hit an enemy piece
                    % up and left
                    i=1;
                    while is_inbound(r-i, c-i)
                        if is_black(game_status, r-i, c-i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r-i, c-i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c-i) = 18;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                            end
                            break;
                        end
                        if game_status(r-i, c-i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c-i) = 18;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                            end
                        end
                        i=i+1;
                    end
        
                    % down and right
                    i=1;
                    while is_inbound(r+i, c+i)
                        if is_black(game_status, r+i, c+i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r+i, c+i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c+i) = 18;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r+i, c+i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c+i) = 18;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
        
                    % up and right
                    i=1;
                    while is_inbound(r-i, c+i)
                        if is_black(game_status, r-i, c+i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r-i, c+i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c+i) = 18;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r-i, c+i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c+i) = 18;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
        
                    % down and left
                    i=1;
                    while is_inbound(r+i, c-i)
                        if is_black(game_status, r+i, c-i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r+i, c-i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c-i) = 18;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r+i, c-i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c-i) = 18;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
        
                % black rook
                case 20
                    % right
                    i=1;
                    while is_inbound(r, c-i)
                        if is_black(game_status, r, c-i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r, c-i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r, c-i) = 20;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r, c-i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r, c-i) = 20;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
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
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r, c+i) = 20;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r, c+i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r, c+i) = 20;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
                    % up
                    i=1;
                    while is_inbound(r-i, c)
                        if is_black(game_status, r-i, c)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r-i, c)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c) = 20;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r-i, c) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c) = 20;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
                    % down
                    i=1;
                    while is_inbound(r+i, c)
                        if is_black(game_status, r+i, c)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r+i, c)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c) = 20;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r+i, c) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c) = 20;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
        
                % black queen
                case 17
                    % right
                    i=1;
                    while is_inbound(r, c-i)
                        if is_black(game_status, r, c-i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r, c-i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r, c-i) = 17;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r, c-i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r, c-i) = 17;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
                    % left
                    i=1;
                    while is_inbound(r, c+i)
                        if is_black(game_status, r, c+i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r, c+i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r, c+i) = 17;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r, c+i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r, c+i) = 17;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
                    % up
                    i=1;
                    while is_inbound(r-i, c)
                        if is_black(game_status, r-i, c)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r-i, c)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c) = 17;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r-i, c) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c) = 17;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
                    % down
                    i=1;
                    while is_inbound(r+i, c)
                        if is_black(game_status, r+i, c)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r+i, c)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c) = 17;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r+i, c) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c) = 17;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
        
                    % up and left
                    i=1;
                    while is_inbound(r-i, c-i)
                        if is_black(game_status, r-i, c-i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r-i, c-i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c-i) = 17;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r-i, c-i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c-i) = 17;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
        
                    % down and right
                    i=1;
                    while is_inbound(r+i, c+i)
                        if is_black(game_status, r+i, c+i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r+i, c+i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c+i) = 17;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r+i, c+i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c+i) = 17;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
        
                    % up and right
                    i=1;
                    while is_inbound(r-i, c+i)
                        if is_black(game_status, r-i, c+i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r-i, c+i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c+i) = 17;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r-i, c+i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c+i) = 17;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
        
                    % down and left
                    i=1;
                    while is_inbound(r+i, c-i)
                        if is_black(game_status, r+i, c-i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r+i, c-i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c-i) = 17;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r+i, c-i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c-i) = 17;
                            if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
        
                % black king
                case 16
                    if is_inbound(r-1, c-1) && (game_status(r-1, c-1) == 8 || is_white(game_status, r-1, c-1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r-1, c-1) = 16;
                        if ~in_check(new_game_status, 1)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r, c-1) && (game_status(r, c-1) == 8 || is_white(game_status, r, c-1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r, c-1) = 16;
                        if ~in_check(new_game_status, 1)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r+1, c-1) && (game_status(r+1, c-1) == 8 || is_white(game_status, r+1, c-1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+1, c-1) = 16;
                        if ~in_check(new_game_status, 1)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r+1, c) && (game_status(r+1, c) == 8 || is_white(game_status, r+1, c))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+1, c) = 16;
                        if ~in_check(new_game_status, 1)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
        
                    if is_inbound(r+1, c+1) && (game_status(r+1, c+1) == 8 || is_white(game_status, r+1, c+1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+1, c+1) = 16;
                        if ~in_check(new_game_status, 1)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
        
                    if is_inbound(r, c+1) && (game_status(r, c+1) == 8 || is_white(game_status, r, c+1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r, c+1) = 16;
                        if ~in_check(new_game_status, 1)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
        
                    if is_inbound(r-1, c+1) && (game_status(r-1, c+1) == 8 || is_white(game_status, r-1, c+1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r-1, c+1) = 16;
                        if ~in_check(new_game_status, 1)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
        
                    if is_inbound(r-1, c) && (game_status(r-1, c) == 8 || is_white(game_status, r-1, c))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r-1, c) = 16;
                        if ~in_check(new_game_status, 1)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
            end
            else
                % check white instead, do later
                switch(game_piece)
                % white pawn 
                case 9
                    if is_inbound(r+1, c) && (game_status(r+1, c) == 8)
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+1, c) = 9;
                        if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    % if it's the first move the pawn can move 2 squares
                    if is_inbound(r+2, c) && (r == 2 && game_status(r+2, c) == 8)
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+2, c) = 9;
                        if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    
                    % check if you can take a piece on right
                    if is_inbound(r+1, c+1) && is_white(game_status, r+1, c+1)
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+1, c+1) = 9;
                        if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
        
                    % check if you can take a piece on left
                    if is_inbound(r+1, c-1) && is_white(game_status, r+1, c-1)
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+1, c-1) = 9;
                        if ~in_check(new_game_status, 0)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
        
                % white knight
                case 14
                    if is_inbound(r-2, c+1) && (game_status(r-2, c+1) == 8 || is_white(game_status, r-2, c+1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r-2, c+1) = 14;
                        if ~in_check(new_game_status, 0)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r-2, c-1) && (game_status(r-2, c-1) == 8 || is_white(game_status, r-2, c-1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r-2, c-1) = 14;
                        if ~in_check(new_game_status, 0)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r-1, c+2) && (game_status(r-1, c+2) == 8 || is_white(game_status, r-1, c+2))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r-1, c+2) = 14;
                        if ~in_check(new_game_status, 0)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r-2, c-2) && (game_status(r-1, c-2) == 8 || is_white(game_status, r-1, c-2))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r-2, c-2) = 14;
                        if ~in_check(new_game_status, 0)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r+2, c+1) && (game_status(r+2, c+1) == 8 || is_white(game_status, r+2, c+1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+2, c+1) = 14;
                        if ~in_check(new_game_status, 0)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r+2, c-1) && (game_status(r+2, c-1) == 8 || is_white(game_status, r+2, c-1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+2, c-1) = 14;
                        if ~in_check(new_game_status, 0)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r+1, c+2) && (game_status(r+1, c+2) == 8 || is_white(game_status, r+1, c+2))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+1, c+2) = 14;
                        if ~in_check(new_game_status, 0)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r+1, c-2) && (game_status(r+1, c-2) == 8 || is_white(game_status, r+1, c-2))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+1, c-2) = 14;
                        if ~in_check(new_game_status, 0)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
        
                % white bishop
                case 13
                        % loop until i go out of bounds or hit an enemy piece
                    % up and left
                    i=1;
                    while is_inbound(r-i, c-i)
                        if is_black(game_status, r-i, c-i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r-i, c-i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c-i) = 13;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                            end
                            break;
                        end
                        if game_status(r-i, c-i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c-i) = 13;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                            end
                        end
                        i=i+1;
                    end
        
                    % down and right
                    i=1;
                    while is_inbound(r+i, c+i)
                        if is_black(game_status, r+i, c+i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r+i, c+i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c+i) = 13;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r+i, c+i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c+i) = 13;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
        
                    % up and right
                    i=1;
                    while is_inbound(r-i, c+i)
                        if is_black(game_status, r-i, c+i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r-i, c+i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c+i) = 13;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r-i, c+i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c+i) = 13;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
        
                    % down and left
                    i=1;
                    while is_inbound(r+i, c-i)
                        if is_black(game_status, r+i, c-i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r+i, c-i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c-i) = 13;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r+i, c-i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c-i) = 13;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
        
                % white rook
                case 15
                    % right
                    i=1;
                    while is_inbound(r, c-i)
                        if is_black(game_status, r, c-i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r, c-i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r, c-i) = 15;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r, c-i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r, c-i) = 15;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
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
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r, c+i) = 15;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r, c+i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r, c+i) = 15;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
                    % up
                    i=1;
                    while is_inbound(r-i, c)
                        if is_black(game_status, r-i, c)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r-i, c)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c) = 15;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r-i, c) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c) = 15;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
                    % down
                    i=1;
                    while is_inbound(r+i, c)
                        if is_black(game_status, r+i, c)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r+i, c)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c) = 15;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r+i, c) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c) = 15;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
        
                % white queen
                case 12
                    % right
                    i=1;
                    while is_inbound(r, c-i)
                        if is_black(game_status, r, c-i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r, c-i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r, c-i) = 12;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r, c-i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r, c-i) = 12;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
                    % left
                    i=1;
                    while is_inbound(r, c+i)
                        if is_black(game_status, r, c+i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r, c+i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r, c+i) = 12;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r, c+i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r, c+i) = 12;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
                    % up
                    i=1;
                    while is_inbound(r-i, c)
                        if is_black(game_status, r-i, c)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r-i, c)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c) = 12;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r-i, c) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c) = 12;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
                    % down
                    i=1;
                    while is_inbound(r+i, c)
                        if is_black(game_status, r+i, c)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r+i, c)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c) = 12;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r+i, c) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c) = 12;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
        
                    % up and left
                    i=1;
                    while is_inbound(r-i, c-i)
                        if is_black(game_status, r-i, c-i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r-i, c-i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c-i) = 12;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r-i, c-i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c-i) = 12;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
        
                    % down and right
                    i=1;
                    while is_inbound(r+i, c+i)
                        if is_black(game_status, r+i, c+i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r+i, c+i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c+i) = 12;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r+i, c+i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c+i) = 12;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
        
                    % up and right
                    i=1;
                    while is_inbound(r-i, c+i)
                        if is_black(game_status, r-i, c+i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r-i, c+i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c+i) = 12;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r-i, c+i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r-i, c+i) = 12;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
        
                    % down and left
                    i=1;
                    while is_inbound(r+i, c-i)
                        if is_black(game_status, r+i, c-i)
                            new_game_status = game_status;
                            break;
                        end
                        if is_white(game_status, r+i, c-i)
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c-i) = 12;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                            break;
                        end
                        if game_status(r+i, c-i) == 8
                            new_game_status = game_status;
                            new_game_status(r,c) = 8;
                            new_game_status(r+i, c-i) = 12;
                            if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                        end
                        i=i+1;
                    end
        
                % white king
                case 11
                    if is_inbound(r-1, c-1) && (game_status(r-1, c-1) == 8 || is_white(game_status, r-1, c-1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r-1, c-1) = 11;
                        if ~in_check(new_game_status, 0)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r, c-1) && (game_status(r, c-1) == 8 || is_white(game_status, r, c-1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r, c-1) = 11;
                        if ~in_check(new_game_status, 0)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r+1, c-1) && (game_status(r+1, c-1) == 8 || is_white(game_status, r+1, c-1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+1, c-1) = 11;
                        if ~in_check(new_game_status, 0)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                    if is_inbound(r+1, c) && (game_status(r+1, c) == 8 || is_white(game_status, r+1, c))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+1, c) = 11;
                        if ~in_check(new_game_status, 0)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
        
                    if is_inbound(r+1, c+1) && (game_status(r+1, c+1) == 8 || is_white(game_status, r+1, c+1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r+1, c+1) = 11;
                        if ~in_check(new_game_status, 0)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
        
                    if is_inbound(r, c+1) && (game_status(r, c+1) == 8 || is_white(game_status, r, c+1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r, c+1) = 11;
                        if ~in_check(new_game_status, 0)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
        
                    if is_inbound(r-1, c+1) && (game_status(r-1, c+1) == 8 || is_white(game_status, r-1, c+1))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r-1, c+1) = 11;
                        if ~in_check(new_game_status, 0)
                        legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
        
                    if is_inbound(r-1, c) && (game_status(r-1, c) == 8 || is_white(game_status, r-1, c))
                        new_game_status = game_status;
                        new_game_status(r,c) = 8;
                        new_game_status(r-1, c) = 11;
                        if ~in_check(new_game_status, 0)
                            legal_positions = cat(3, legal_positions, new_game_status);
                        end
                    end
                end
            end
        end
    end
end