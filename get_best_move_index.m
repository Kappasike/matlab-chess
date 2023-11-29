function [best_index] = get_best_move_index(game_status)

    best_index = 1;
    best_eval = 1000;
    legal_positions = get_bot_positions(game_status, true);
    move_index_eval = [];
    for i=1:size(legal_positions, 3)
        temp_eval = minimax(legal_positions(:,:,i), -1000, 1000, false, 0);
        if temp_eval <= best_eval
            best_eval = temp_eval;
            best_index = i;
            move_index_eval = vertcat(move_index_eval, [i temp_eval]);
        end
    end
    % if the highest eval is tied this has all the move indices for the
    % tied moves
    filtered_move_indices = move_index_eval(move_index_eval(:, 2)==best_eval, 1);
    
end