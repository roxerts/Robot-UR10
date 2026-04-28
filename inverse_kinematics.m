ik = inverseKinematics('RigidBodyTree', robot);

weights = [0.5 0.5 0.5 1 1 1];
initialguess = homeConfiguration(robot);

% Slightly lift robot and orient forward
initialguess(2) = -pi/4;
initialguess(3) = pi/3;
initialguess(5) = pi/2;

% Desired final pose
T = trvec2tform([0.50 0.00 0.10]) * eul2tform([0 0 0]);

% IMPORTANT: use correct end-effector name
endEffector = 'tool0';

[configSol, ~] = ik(endEffector, T, weights, initialguess);