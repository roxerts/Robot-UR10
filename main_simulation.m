clc; clear; close all;

% Load robot
run('robot_model.m');

% Solve inverse kinematics
run('inverse_kinematics.m');

% Generate trajectory
run('trajectory.m');

% Animate   
run('animation.m');