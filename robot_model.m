% Load UR10 with visuals
robot = loadrobot('universalUR10', ...
    'DataFormat','row', ...
    'Gravity',[0 0 -9.81]);

% Show robot once
figure;
ax = axes;

show(robot, 'Parent', ax);
view(135,25);
axis equal;
grid on;

title('UR10 Robot (Loaded Model)');