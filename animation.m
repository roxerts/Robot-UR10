figure;
ax = axes;

view(3);
axis equal;
grid on;

xlabel('X'); ylabel('Y'); zlabel('Z');

% Workspace limits (IMPORTANT)
axis([-0.5 0.8 -0.5 0.5 0 0.6]);

hold on;

%% ===== INITIAL ROBOT =====
show(robot, q0, ...
    'Parent', ax, ...
    'PreservePlot', false);

%% ===== CUBE =====
cube_size = 0.1;

V = [
0 0 0;
1 0 0;
1 1 0;
0 1 0;
0 0 1;
1 0 1;
1 1 1;
0 1 1] * cube_size;

F = [
1 2 3 4;
5 6 7 8;
1 2 6 5;
2 3 7 6;
3 4 8 7;
4 1 5 8];

% Initial cube position
cube_init = V + [0.45 0.20 0.10];

hCube = patch('Vertices', cube_init, ...
              'Faces', F, ...
              'FaceColor', 'cyan', ...
              'FaceAlpha', 0.7);

endEffector = 'tool0';

%% ===== ANIMATION LOOP =====
for i = 1:size(configs,1)

    show(robot, configs(i,:), ...
        'PreservePlot', false, ...
        'Parent', ax);

    % Get pose
    T = getTransform(robot, configs(i,:), 'tool0');

    % Move cube
    cube_moved = (T(1:3,1:3) * V')' + T(1:3,4)';
    set(hCube, 'Vertices', cube_moved);

    drawnow;
end