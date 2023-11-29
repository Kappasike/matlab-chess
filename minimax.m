function [eval] = minimax(game_status, a, b, turn, depth)
    % should get the index of the best move
    % first just get best move
    if depth == 2
        eval = evaluate_board(game_status);
        return;
    end
    
    %
    if turn % black
        legal_positions = get_bot_positions(game_status, true);
        best = 1000;
        % if there are no legal_positions then it's checkmate which is bad
        if size(legal_positions)~=0
            for i=1:size(legal_positions, 3)
                val = minimax(legal_positions(:,:,i), a, b, false, depth+1);
                best = min(best, val);
                b = min(b, best);
    
                if b <= a
                    break;
                end
            end
        end
        eval = best;
        return;
    else % white
        legal_positions = get_bot_positions(game_status, false);
        best = -1000;
        if size(legal_positions)~=0
            for i=1:size(legal_positions, 3)
                result = minimax(legal_positions(:,:,i), a, b, true, depth+1);
                val = result(1);
                best = max(best, val);
                a = max(a, best);
    
                if b <= a
                    break;
                end
            end
        end
        eval = best;
        return;
    end
    %
end
