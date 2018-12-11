function [ Y ] = plangenerator( siz )
    % Create a random map.

    Y = round(rand(siz)-0.3);
    point= randi(siz^2,1,2);
    Y(point(1)) = 2;
    Y(point(2)) = 3;
end

