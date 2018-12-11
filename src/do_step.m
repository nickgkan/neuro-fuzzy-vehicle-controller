function [x, y] = do_step(current_position_x, current_position_y, step_x, step_y)

    global map;
    global map_size;

    global goal_position_x;
    global goal_position_y;
    
    if (step_x > 0)    
        true_step_x = step_x;
        for i = 1:1:step_x
            if (current_position_x + i > map_size)
                true_step_x = i - 1;
                break;
            elseif current_position_y == goal_position_y && current_position_x + i == goal_position_x
                true_step_x = i;
                break; 
            elseif map(current_position_y,current_position_x + i) == 0
                true_step_x = i - 1;
                break;
            end
        end

        x = current_position_x + true_step_x;
        y = current_position_y;
        
        if (true_step_x > 0)
            map(current_position_y,current_position_x + 1:current_position_x + true_step_x) = 0.5;
        end    
    elseif (step_x < 0)
        true_step_x = step_x;
        for i = -1:-1:step_x
            if (current_position_x + i <= 0) 
                true_step_x = i + 1;
                break;
            elseif current_position_y == goal_position_y && current_position_x + i == goal_position_x
                true_step_x = i;
                break; 
            elseif map(current_position_y,current_position_x + i) == 0
                true_step_x = i + 1;
                break;
            end
        end

        x = current_position_x + true_step_x;
        y = current_position_y;

        if (true_step_x < 0)
            map(current_position_y,current_position_x + true_step_x:current_position_x - 1) = 0.5;
        end    
        
    elseif (step_y > 0)    
        true_step_y = step_y;
        for i = 1:1:step_y
            if (current_position_y + i > map_size) 
                true_step_y = i - 1;
                break;
            elseif current_position_x == goal_position_x && current_position_y + i == goal_position_y
                true_step_y = i;
                break; 
            elseif map(current_position_y + i,current_position_x) == 0
                true_step_y = i - 1;
                break;
            end
        end

        x = current_position_x;
        y = current_position_y + true_step_y;
        
        if (true_step_y > 0)
            map(current_position_y + 1:current_position_y + true_step_y,current_position_x) = 0.5;
        end    
        
    elseif (step_y < 0)
        true_step_y = step_y;
        for i = -1:-1:step_y
            if (current_position_y + i <= 0) 
                true_step_y = i + 1;
                break;
            elseif current_position_x == goal_position_x && current_position_y + i == goal_position_y
                true_step_y = i;
                break; 
            elseif map(current_position_y + i,current_position_x) == 0
                true_step_y = i + 1;
                break;
            end
        end        
        
        x = current_position_x;
        y = current_position_y + true_step_y;

        if (true_step_y < 0)
            map(current_position_y + true_step_y:current_position_y - 1,current_position_x) = 0.5;
        end    
    end
