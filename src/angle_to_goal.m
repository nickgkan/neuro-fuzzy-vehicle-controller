function  angle = angle_to_goal(current_position_x, current_position_y, goal_position_x, goal_position_y)

y_d = current_position_y - goal_position_y;
x_d = goal_position_x - current_position_x;

if (x_d == 0)
   if (y_d >= 0)
       angle_east = pi/2;
       angle_north = 0;
       angle_west = -pi/2;
       angle_south = pi;
    else
       angle_east = -pi/2;
       angle_north = pi;
       angle_west = pi/2;
       angle_south = 0;
    end
else

    angle = atan(y_d/x_d);

    if (y_d >= 0 && x_d > 0)
       angle_east = angle;
       angle_north = -(pi/2 - angle);
       angle_west = -(pi - angle);
       angle_south = pi/2 + angle;
    elseif (y_d >= 0 && x_d < 0) 
       angle_east = pi + angle;
       angle_north = pi/2 + angle;
       angle_west = angle;
       angle_south = -(pi/2 - angle);
    elseif (y_d <= 0 && x_d < 0)
       angle_east = -(pi - angle);
       angle_north = pi/2 + angle;
       angle_west = angle;
       angle_south = -(pi/2 - angle);
    elseif (y_d <= 0 && x_d > 0) 
       angle_east = angle;
       angle_north = -(pi/2 - angle);
       angle_west = pi + angle;
       angle_south = pi/2 + angle;
    end
end

angle_east = abs(180/pi*angle_east);
angle_north = abs(180/pi*angle_north);
angle_west = abs(180/pi*angle_west);
angle_south = abs(180/pi*angle_south);

angle = [angle_east, angle_north, angle_west, angle_south];
