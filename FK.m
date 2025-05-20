% TODO: Solve for FK Transformation and IK Equations of robot manipulator
% Import in the joint space trajectories


clear all; close all; clc
%% Robot Parameters
% Setup
sympref('FloatingPointOutput',true); % This allows floating point coefficient
format short

% Symbolic variables for link lengths and joint angles
syms l1 l2 l3 l4 t1 t2 t3 t4 d1 a2 a3 a4

% DH parameters for robot
alpha = [0 sym(pi) 0 0 0]; % alpha values for each joint (all are 0 except joint 2 which is pi)
a = [0 0 l2 l3 l4]; % link lengths a (a1 is 0 because joint 1 is fixed)
d = [0 l1 0 0 0]; % link offsets d (d1 is 0 because joint 1 is fixed)
theta = [t1 t2 t3 t4 0]; % joint angles (theta 5 is 0 as it's a fixed joint)

% Define the robot with Robotics Toolbox (if available)
L(1) = Link('revolute','d',d(1),'a',a(1),'alpha',alpha(1),'offset',0,'modified');
L(2) = Link('revolute','d',d(2),'a',a(2),'alpha',alpha(2),'offset',0,'modified');
L(3) = Link('revolute','d',d(3),'a',a(3),'alpha',alpha(3),'offset',0,'modified');
L(4) = Link('revolute','d',d(4),'a',a(4),'alpha',alpha(4),'offset',0,'modified');

% Create the robot object
Robot = SerialLink(L, 'name', '263C Robot Arm')

% Display the robot object
% disp(Robot);