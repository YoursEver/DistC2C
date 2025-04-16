% This function calculates the contour-to-contour distance by using Euclidean distance transform.
%
% [MeanDist, StdevDist, MaxDist]= DistC2C( GTfilename, Inputfilename)
%
% == Input argument ==
% GTfilename: filename of ground-truth
% Inputfilename: filename of the to-be-compare image
%
% == Outputs ==
% MeanDist: mean contour-to-contour distance
% StdevDist: standard deviation. (because we derive the contour-to-contour distance in pixel-wise manner.)
% MaxDist: max contour-to-contour distance
%
%Programmed by Prof. Hao-Chiang Shao, email:shao.haochiang@gmail.com
%This function is used in the revised version of our IEEE T-CAD submission.
%The arxiv version of our paper can be found at https://arxiv.org/abs/2002.04967
%
function [MeanDist, StdevDist, MaxDist]= DistC2C( GTfilename, Inputfilename)

%% READ FILE

%  GTfilename = 'contour1.bmp';
%  Inputfilename = 'contour2.bmp';

GT_img = imread( GTfilename );
Input_img = imread( Inputfilename );

%% Convert to gray-scale images

if length(size(GT_img))==3  
    GT = rgb2gray(GT_img);
else
    GT = GT_img;
end

if length(size(Input_img))==3  
    Input = rgb2gray(Input_img);
else
    Input = Input_img;
end

%% Distance transform of GT's contour

%BW_GT = imbinarize(GT); %binarize first, here use built-in function with default setting (Otsu).
BW_GT = edge(GT, 'canny'); 
Dist_map = bwdist(BW_GT);

%%
%Here use matrix form the derive the MeanDist and VarDist,
%If you want to re-program this function in Python, 
%perhaps it would be better and faster by using for-loop. 

BW_input = edge(Input,'canny'); %edge detection

TotalDist = Dist_map;   
%TotalDist( find( BW_input==0 ) ) = 0; % ZERO everything except for contour points.

%%
%replace Line 56 by Line 60
Dist_ContourPt = TotalDist( find( BW_input~=0 ) ); 

MeanDist = mean( Dist_ContourPt(:) );
StdevDist = std( Dist_ContourPt(:) );
MaxDist = max( Dist_ContourPt(:) );

%Img_Fusion = imfuse(Input_img, BW_GT);
%imwrite( Img_Fusion, ['cnt_' GTfilename(11:end)]);
end