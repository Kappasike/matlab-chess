function [optimal_index] = minimax(game_status, a, b, turn)
    % should get the index of the best move
    % first just get best move
    black_legal_positions = get_bot_positions(game_status, true);
    optimal_index = randi([1, size(black_legal_positions, 3)]);
    white_index = 0;
    % iterate through all legal moves 
    for i=1:size(black_legal_positions, 3)
        white_legal_positions = get_bot_positions(black_legal_positions(:,:,i),false);
        for j=1:size(white_legal_positions, 3)
            w_temp_eval = evaluate_board(white_legal_positions(:,:,j));
            if w_temp_eval > a
                a = w_temp_eval;
                white_index = j;
        end
        temp_eval = evaluate_board(white_legal_positions(:,:,j));
        if temp_eval < b
            b = temp_eval;
            optimal_index = i;
        end
    end
end