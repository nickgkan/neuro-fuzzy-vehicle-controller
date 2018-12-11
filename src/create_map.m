function create_map(plan)

global map;
global map_size;

global init_position_x;
global init_position_y;
global goal_position_x;
global goal_position_y;

y_size = size(plan,1);
x_size = size(plan,2);

x_step = floor(map_size/x_size);
y_step = floor(map_size/y_size);

map = ones(map_size,map_size);

for j = 1:y_size
    for i = 1:x_size
        if plan(j,i) == 1
            map(floor((j-1)*map_size/y_size) + 1:floor(j*map_size/y_size), floor((i-1)*map_size/x_size) + 1:floor(i*map_size/x_size)) = 0;
        elseif plan(j,i) == 2
            init_position_y = floor((j-0.5)*map_size/y_size);
            init_position_x = floor((i-0.5)*map_size/x_size);
            
            map(init_position_y, init_position_x) = 0.25;
            map(init_position_y + 1, init_position_x + 1) = 0.25;
            map(init_position_y + 2, init_position_x + 2) = 0.25;
            map(init_position_y + 1, init_position_x - 1) = 0.25;
            map(init_position_y + 2, init_position_x - 2) = 0.25;
            map(init_position_y - 1, init_position_x + 1) = 0.25;
            map(init_position_y - 2, init_position_x + 2) = 0.25;
            map(init_position_y - 1, init_position_x - 1) = 0.25;
            map(init_position_y - 2, init_position_x - 2) = 0.25;
        elseif plan(j,i) == 3
            goal_position_y = floor(((2*j-1)*map_size/y_size)/2);
            goal_position_x = floor(((2*i-1)*map_size/x_size)/2);
            
            map(goal_position_y, goal_position_x) = 0.25;
            map(goal_position_y + 1, goal_position_x + 1) = 0.25;
            map(goal_position_y + 1, goal_position_x - 1) = 0.25;
            map(goal_position_y - 1, goal_position_x + 1) = 0.25;
            map(goal_position_y - 1, goal_position_x - 1) = 0.25;
            map(goal_position_y + 2, goal_position_x) = 0.25;
            map(goal_position_y - 2, goal_position_x) = 0.25;
            map(goal_position_y, goal_position_x + 2) = 0.25;
            map(goal_position_y, goal_position_x - 2) = 0.25;
        end
    end
end
