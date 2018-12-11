clear all
clc
close all
addpath 'files'
addpath 'src'

%% GLOBAL CONFIGURATION
global map;
global map_size;

map_size = 400;

maps = standard_plans();

max_iterations = 60;

%% FUZZY SYSTEMS

fis_files = {'fuzzy_system_5_rules.fis', 'fuzzy_system_3_rules.fis'};

for f = 1:1:2
    fis_file = readfis(fis_files{f});
    for map_id = [1 2 3 5 6]
        if (map_id == 6) && (f == 2)
            break;
        end
        create_map(maps{map_id});
        figure('name', sprintf('Plan %d of version %d', map_id, f))
        imshow(map);
        [~] = approach_goal(fis_file, max_iterations, f == 1);
        if f == 1 && map_id == 1
            frame = getframe(gcf);
            img = frame2im(frame);
            [img, cmap] = rgb2ind(img, 256);
            if map_id == 1
                imwrite(...
                    img, cmap, 'animation.gif', 'gif',...
                    'LoopCount', Inf, 'DelayTime', 0.03...
                );
            else
                imwrite(...
                    img, cmap, 'animation.gif', 'gif',...
                    'WriteMode', 'append', 'DelayTime', 0.03...
                );
            end
        end
    end
end

% Random maps
for f = 1:1:2
    fis_file = readfis(fis_files{f});
    for map_id=1:1:3
        create_map(plangenerator(11));
        figure('name', sprintf('Random plan %d of version %d', map_id, f))
        imshow(map);
        [~] = approach_goal(fis_file, max_iterations, false);
    end
end


%% NEURO-FUZZY SYSTEMS

fis_files = {'neurofuzzy_system_5_rules.fis', 'neurofuzzy_system_3_rules.fis'};
N = 10;

for f=1:1:2
    close all
    fis_file = readfis(fis_files{f});
    for map_id=1:1:N
        if map_id < 8
            create_map(maps{map_id});
        else
            create_map(plangenerator(11));
        end
        figure('name', sprintf('Plan %d of version %d', map_id, f))
        imshow(map);
        [~] = approach_goal(fis_file, max_iterations, false);
    end
end