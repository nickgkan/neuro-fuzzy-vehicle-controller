function data = approach_goal(fis, max_iterations, write_to_gif)

global map;
global map_size;

global init_position_x;
global init_position_y;
global goal_position_x;
global goal_position_y;

current_position_x = init_position_x;
current_position_y = init_position_y;

data = [];
for i = 1:max_iterations
    dist = distance_to_obstacles(current_position_x, current_position_y);
    angle = angle_to_goal(current_position_x, current_position_y, goal_position_x, goal_position_y);
    
    input = [angle' dist'];
    speed = [evalfis(input(1,:), fis)' evalfis(input(2,:), fis)' evalfis(input(3,:), fis)' evalfis(input(4,:), fis)'];
    
    data = [data; angle(1,1) dist(1,1) speed(1,1)];
    data = [data; angle(1,2) dist(1,2) speed(1,2)];
    data = [data; angle(1,3) dist(1,3) speed(1,3)];
    data = [data; angle(1,4) dist(1,4) speed(1,4)];
    
    direction = find(speed == max(speed));
    speed = ceil(speed);
    if (length(direction) > 1)
        direction = direction(round((length(direction) - 1)*rand) + 1);
    end
    
    if speed(direction) == 0
        break;
    end
    
    if (direction == 1) % move east
        [new_current_position_x, new_current_position_y] = do_step(current_position_x,current_position_y, speed(direction),0);
    elseif (direction == 2) % move north
        [new_current_position_x, new_current_position_y] = do_step(current_position_x,current_position_y,0,-speed(direction));
    elseif (direction == 3) % move west
        [new_current_position_x, new_current_position_y] = do_step(current_position_x,current_position_y,-speed(direction),0);
    elseif (direction == 4) % move south
        [new_current_position_x, new_current_position_y] = do_step(current_position_x,current_position_y,0,speed(direction));
    end
   
    if (new_current_position_x == goal_position_x && new_current_position_y == goal_position_y)
        break;
    end
    
    if (new_current_position_x == current_position_x && new_current_position_y == current_position_y)
        break;
    end
    
    current_position_x = new_current_position_x;
    current_position_y = new_current_position_y;

    imshow(map);
    
    if write_to_gif
        frame = getframe(gcf);
        img = frame2im(frame);
        [img, cmap] = rgb2ind(img, 256);
        imwrite(img, cmap, 'animation.gif', 'gif', 'WriteMode', 'append', 'DelayTime', 0.03);
    end
end
