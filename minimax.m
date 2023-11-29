function [optimal_index] = minimax(game_status, a, b, turn)
    % should get the index of the best move
    % first just get best move
    black_legal_positions = get_bot_positions(game_status, true);
    optimal_index = randi([1, size(legal_positions, 3)]);
    % iterate through all legal moves 
    best_eval = 1000;
    for i=1:size(legal_positions, 3)
        white_legal_moves = get_bot_positions(legal_positions(:,:,i),false);
        temp_eval = evaluate_board(legal_positions(:,:,i));
        if temp_eval < best_eval
            best_eval = temp_eval;
            optimal_index = i;
        end
    end
end