% Initial configuration
q0 = homeConfiguration(robot);

ik = inverseKinematics('RigidBodyTree', robot);
weights = [0.5 0.5 0.5 1 1 1];
endEffector = 'tool0';

% ---- WAYPOINTS (KEY IDEA) ----
T_start = getTransform(robot, q0, endEffector);

% Lift up first (avoids floor)
T_lift = trvec2tform([0.45 0.20 0.35]);

% Move horizontally
T_move = trvec2tform([0.50 0.00 0.35]);

% Go down to final
T_final = trvec2tform([0.50 0.00 0.25]);

waypoints = cat(3, T_start, T_lift, T_move, T_final);

tpts = [0 1 2 3];
tvec = linspace(0,3,60);

traj = transformtraj(waypoints(:,:,1), waypoints(:,:,end), tpts([1 end]), tvec);

% Preallocate
configs = zeros(length(tvec), numel(q0));

% Solve IK progressively (IMPORTANT)
q_current = q0;

for i = 1:length(tvec)
    [q_current, ~] = ik(endEffector, traj(:,:,i), weights, q_current);
    configs(i,:) = q_current;
end