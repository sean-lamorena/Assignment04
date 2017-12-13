clear all; close all; clc;

I = imread('envelope3.jpg');
Imed = medfilt2(I,[100 100]);
Ifinal = Imed - I;
BW = Ifinal > 50;
[H,theta,rho] = hough(BW);
P = houghpeaks(H,10,'threshold',500);
lines = houghlines(BW,theta,rho,P);
tempangle = lines.theta;
angle = 90 + tempangle;
Irot = imrotate(I,angle,'crop');
Imed = medfilt2(Irot,[100 100]);
Ifinal = Imed - Irot;
BW1 = Ifinal > 50;
Isub = BW1(700:1050,1:750,1);
imshow(Isub);