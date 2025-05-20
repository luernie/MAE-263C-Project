% TODO: Solve for FK Transformation and IK Equations of robot manipulator
% Import in the joint space trajectories


clear all; close all; clc
%% Robot Parameters
% Setup
sympref('FloatingPointOutput',true) % This allows floating point coefficient
format short
syms l1 l2 l3 l4 t1 t2 t3 t4 d4 dt1 dt2 dt3 dt4 d1 a2 a3 a4

% Given Robot Link Parameters
% d1 = 0.416; % m
% a2 = 0.325; % m
% a3 = 0.225; % m

% DH parameters for robot
alpha = [0 sym(pi) 0 0 0]; % Create a symbolic representation of a constant
a   =   [0 0 l2 l3 l4];
d   =   [0 l1 0 0 0];
theta = [t1 t2 t3 t4 0];

% Define the robot with Robot Toolbox
L(1) = Link('revolute','d',d1,'a',0,'alpha',0,'modified');
L(2) = Link('revolute','d',0,'a',a2,'alpha',0,'modified');
L(3) = Link('revolute','d',0,'a',a3,'alpha',0,'modified');
L(4) = Link('revolute','d',0,'a',a4,'alpha',0,'modified');
L(5) = Link('revolute','d',0,'a',a4,'alpha',0,'modified');


% L(4) = Link('prismatic','a',0,'alpha',pi,'theta', 0,'modified', 'qlim', [0 d1]); % add limits of the d4
Robot = SerialLink(L, 'name', '263C Robot Arm') % Combine Link objects together to form a Robot Object