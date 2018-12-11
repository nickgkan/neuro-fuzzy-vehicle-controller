function distance = distance_to_obstacles(current_position_x, current_position_y)

global map;
global map_size;

distance_east = 0;
if (current_position_x < map_size) 
    for i = current_position_x + 1:1:map_size
        if map(current_position_y, i) == 0
            break;
        else 
            distance_east = distance_east + 1;
        end
    end
end 
    
distance_west = 0;
if (current_position_x > 1) 
    for i = current_position_x - 1:-1:1
        if map(current_position_y, i) == 0
            break;
        else 
            distance_west = distance_west + 1;
        end
    end
end
    
distance_north = 0;
if (current_position_y > 1) 
    for i = current_position_y - 1:-1:1
        if map(i,current_position_x) == 0
            break;
        else 
            distance_north = distance_north + 1;
        end
    end
end

distance_south = 0;
if (current_position_y < map_size)
    for i = current_position_y + 1:1:map_size
        if map(i,current_position_x) == 0
            break;
        else 
            distance_south = distance_south + 1;
        end 
    end
end

distance = [distance_east, distance_north, distance_west, distance_south];
