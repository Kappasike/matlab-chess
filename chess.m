clear;
clc;

main_scene = simpleGameEngine('chessatlas.png', 84, 84);

ds = 1; % light square
ls = 2; % dark square
tp = 8; % transparent square
ss = 25; % color when a tile is selected

% white pieces
wk = 11;
wp = 9;
wq = 12;
wb = 13;
wn = 14;
wr = 15;

% black pieces
bk = 16;
bp = 10;
bq = 17;
bb = 18;
bn = 19;
br = 20;

bg = [
        ls, ds, ls, ds, ls, ds, ls, ds;
        ds, ls, ds, ls, ds, ls, ds, ls;
        ls, ds, ls, ds, ls, ds, ls, ds;
        ds, ls, ds, ls, ds, ls, ds, ls;
        ls, ds, ls, ds, ls, ds, ls, ds;
        ds, ls, ds, ls, ds, ls, ds, ls;
        ls, ds, ls, ds, ls, ds, ls, ds;
        ds, ls, ds, ls, ds, ls, ds, ls;
    ];
    
    % this contains the splash screen
    game_start = [
        tp, tp, tp, tp, tp, tp, tp, tp;
        tp, tp, tp, tp, tp, tp, tp, tp;
        tp, tp, tp, tp, tp, tp, tp, tp;
        tp, tp, 21, 22, 23, 24, tp, tp;
        tp, tp, tp, tp, tp, tp, tp, tp;
        tp, tp, tp, tp, tp, tp, tp, tp;
        tp, tp, tp, tp, tp, tp, tp, tp;
        tp, tp, tp, tp, tp, tp, tp, tp;
    ];

    % says checkmate and has quit and continue button
    game_over = [
        tp, tp, tp, tp, tp, tp, tp, tp;
        tp, tp, tp, tp, tp, tp, tp, tp;
        tp, tp, tp, 6 , 7 , tp, tp, tp;
        tp, tp, tp, tp, tp, tp, tp, tp;
        tp, tp, 21, 22, 23, 24, tp, tp;
        tp, tp, tp, tp, tp, tp, tp, tp;
        tp, tp, tp, tp, tp, tp, tp, tp;
        tp, tp, tp, tp, tp, tp, tp, tp;
    ];

checkmate = false;

while 1
    % turn, turn is 0 if white turn, 1 if black turn
    turn = 0;

    if checkmate
        checkmate = false;
        drawScene(main_scene, bg, game_over);
        title("Checkmate");
        [r,c] = getMouseInput(main_scene);
        if r==5 && (c == 5 || c == 4)
            return;
        end
    end

    % castleing, en pessanting, check, checkmate, king death animation
    % this is the current status of the game, aka where the pieces are, turns
    game_status = [
        br, bn, bb, bq, bk, bb, bn, br;
        bp, bp, bp, bp, bp, bp, bp, bp;
        tp, tp, tp, tp, tp, tp, tp, tp;
        tp, tp, tp, tp, tp, tp, tp, tp;
        tp, tp, tp, tp, tp, tp, tp, tp;
        tp, tp, tp, tp, tp, tp, tp, tp;
        wp, wp, wp, wp, wp, wp, wp, wp;
        wr, wn, wb, wq, wk, wb, wn, wr;
    ];

    l_br_has_moved = 0;
    l_wr_has_moved = 0;
    r_br_has_moved = 0;
    r_wr_has_moved = 0;

    drawScene(main_scene, bg, game_start);
    title("Start Menu");

    [r,c] = getMouseInput(main_scene);
    % check if player is clicking on start button
    if r==4 && (c == 5 || c == 4)
        % draw the start of the game setup
        drawScene(main_scene, bg, game_status);
        xlabel("a                b               c               d               e               " + ...
           "f               g               h");
        ylabel("1                2               3               4               5               " + ...
           "6               7               8");
        title("Game Start");
        while 1
            % let them choose what piece they want to move
            [r,c] = getMouseInput(main_scene);
            if (turn && is_black(game_status, r, c)) || (~turn && is_white(game_status, r, c))
                prev_color = bg(r,c);
                bg(r,c) = ss;
                selected_piece = game_status(r,c);
                fprintf("cursor x: %d\n", r);
                fprintf("cursor y: %d\n", c);
                drawScene(main_scene, bg, game_status);
                title("Selection In Progress");
        
                [x,y] = getMouseInput(main_scene);
                
                %
        
                if can_move(game_status, r, c, x, y, turn)
                    game_status(r,c) = tp;
                    game_status(x,y) = selected_piece;
                    turn = ~turn;
                    checkmate = is_checkmate(game_status, turn);
                end

                
        
                bg(r,c) = prev_color;
                drawScene(main_scene, bg, game_status);
                title("Selection Made");

                if checkmate
                    fprintf("checkmate liberals\n");
                    break;
                end
            end
        end
    end
end

%                       -----Evaluation-----
% Making this wasn't too difficult because chess is kind of the perfect
% game for the simple game engine but it was a little hard to find out
% how to properly use texture atlasing and I ended up using my own texture
% atlas which I had to make.
% 
% For questions I honestly don't have any I can think of so far I
% have the core game implemented I just have to make functions that
% determine whether a move is illegal or not and add the logic so it
% switches from white's turn and black's turn but besides that I'm good to
% go. I currently don't have any plans to change anything.
% 