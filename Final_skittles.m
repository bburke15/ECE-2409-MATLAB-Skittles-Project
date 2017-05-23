%% Final Skittles Project
%% ECE 2409-001
%% Yiwei Shen, Brendan Burke, Colin O'Leary

clear;clc;close all
Published=datestr(now, 21)

figure(1)
m = imread('Skittles6.jpg'); %Load image into Matlab
imshow(m)
n = imresize(m,.03); %Resize image to pixelate original image.
%n = imresize(m,0.08);
%This reduces the amount of data in the image and makes color
%identification easier.
%divide image into its RGB color pages
r=n(:,:,1);
g=n(:,:,2);
b=n(:,:,3);
%Define RGB color pointers to define what constitutes a given skittle color 
y = [r > 185 & r < 260 & g > 190 & g < 255 & b > -1  & b < 100];
o = [r > 230 & r < 260 & g > 80 & g < 160 & b > -1 & b < 110];
gr = [r > 20 & r < 110 & g > 150 & g < 230 & b > -1  & b < 90];
re = [r > 165 & r < 215 & g > 20& g < 100 & b > -1  & b < 110];
p = [r > 5 & r < 117 & g > 0 & g < 130 & b > -1  & b < 150];
%These RGB data values are based on samples of RGB values from various
%other skittles pictures/
pause(2) %pause for 2 seconds

%% highlight red skittles
fig = figure(2);
set(fig,'units','normalized','outerposition',[0 0 1 1]);
%Fits figure window (of resized image) to size of screen
loc = find(re==0); %Find where red not found
%set the colors of those other locations to white.
r(loc)=255;
g(loc)=255;
b(loc)=255;
%highlights red by making everything not red white.
new = cat(3,r,g,b);
%put image back together (concatenate). 
imshow(new)
pause(2)

%% highlights green skittles
%repeat above highlighting process for all other skittles colors
fig = figure(3);
set(fig,'units','normalized','outerposition',[0 0 1 1]);
r=n(:,:,1);
g=n(:,:,2);
b=n(:,:,3);
y = [r > 185 & r < 260 & g > 190 & g < 255 & b > -1  & b < 100];
o = [r > 230 & r < 260 & g > 80 & g < 160 & b > -1 & b < 110];
gr = [r > 20 & r < 110 & g > 150 & g < 230 & b > -1  & b < 90];
re = [r > 165 & r < 215 & g > 20& g < 100 & b > -1  & b < 110];
p = [r > 5 & r < 117 & g > 0 & g < 130 & b > -1  & b < 150];
loc = find(gr==0);
r(loc)=255;
g(loc)=255;
b(loc)=255;
new = cat(3,r,g,b);
imshow(new)
pause(2)

%% highlights yellow skittles
fig = figure(4);
set(fig,'units','normalized','outerposition',[0 0 1 1]);
r=n(:,:,1);
g=n(:,:,2);
b=n(:,:,3);
y = [r > 185 & r < 260 & g > 190 & g < 255 & b > -1  & b < 100];
o = [r > 230 & r < 260 & g > 80 & g < 160 & b > -1 & b < 110];
gr = [r > 20 & r < 110 & g > 150 & g < 230 & b > -1  & b < 90];
re = [r > 165 & r < 215 & g > 20& g < 100 & b > -1  & b < 110];
p = [r > 5 & r < 117 & g > 0 & g < 130 & b > -1  & b < 150];
loc = find(y==0);
r(loc)=255;
g(loc)=255;
b(loc)=255;
new = cat(3,r,g,b);
imshow(new)
pause(2)

%% highlights purple skittles
fig = figure(5);
set(fig,'units','normalized','outerposition',[0 0 1 1]);
r=n(:,:,1);
g=n(:,:,2);
b=n(:,:,3);
y = [r > 185 & r < 260 & g > 190 & g < 255 & b > -1  & b < 100];
o = [r > 230 & r < 260 & g > 80 & g < 160 & b > -1 & b < 110];
gr = [r > 20 & r < 110 & g > 150 & g < 230 & b > -1  & b < 90];
re = [r > 165 & r < 215 & g > 20& g < 100 & b > -1  & b < 110];
p = [r > 5 & r < 117 & g > 0 & g < 130 & b > -1  & b < 150];
loc = find(p==0);
r(loc)=255;
g(loc)=255;
b(loc)=255;
new = cat(3,r,g,b);
imshow(new)
pause(2)

%% highlights orange skittles
fig = figure(6);
set(fig,'units','normalized','outerposition',[0 0 1 1]);
r=n(:,:,1);
g=n(:,:,2);
b=n(:,:,3);
y = [r > 185 & r < 260 & g > 190 & g < 255 & b > -1  & b < 100];
o = [r > 230 & r < 260 & g > 80 & g < 160 & b > -1 & b < 110];
gr = [r > 20 & r < 110 & g > 150 & g < 230 & b > -1  & b < 90];
re = [r > 165 & r < 215 & g > 20& g < 100 & b > -1  & b < 110];
p = [r > 5 & r < 117 & g > 0 & g < 130 & b > -1  & b < 150];
loc = find(o==0);
r(loc)=255;
g(loc)=255;
b(loc)=255;
new = cat(3,r,g,b);
imshow(new)
pause(2)

%% count red skittles
loc = find(re==0); %find where not red
loc1 = find(re==1); %find where red
%make found red white
r(loc1)=0;
g(loc1)=0;
b(loc1)=0;
%make all else black
r(loc)=255;
g(loc)=255;
b(loc)=255;
new=cat(3,r,g,b);
%put back together
BW = im2bw(new); %convert to binary image (1s and 0s)
ComplementImage=imcomplement(BW); %complement image
HolesClearedImage = imfill(ComplementImage,'holes'); %fill holes (caused by glare, etc)   
measurements = regionprops(HolesClearedImage, 'Centroid', 'Area');
red = length(measurements);
%counts circles (to get count of red skittles)

%% count green skittles
%repeat above process for all other skittle colors
loc = find(gr==0);
loc1 = find(gr==1);
r(loc1)=0;
g(loc1)=0;
b(loc1)=0;
r(loc)=255;
g(loc)=255;
b(loc)=255;
new=cat(3,r,g,b);
BW = im2bw(new);
ComplementImage=imcomplement(BW);
HolesClearedImage = imfill(ComplementImage,'holes');
cc = bwconncomp(HolesClearedImage,18);
measurements = regionprops(HolesClearedImage, 'Centroid', 'Area');
green = length(measurements);

%% count purple skittles
loc = find(p==0);
loc1 = find(p==1);
r(loc1)=0;
g(loc1)=0;
b(loc1)=0;
r(loc)=255;
g(loc)=255;
b(loc)=255;
new=cat(3,r,g,b);
BW = im2bw(new);
ComplementImage=imcomplement(BW);
HolesClearedImage = imfill(ComplementImage,'holes');
measurements = regionprops(HolesClearedImage, 'Centroid', 'Area');
purple = length(measurements);

%% count yellow skittles
loc = find(y==0);
loc1 = find(y==1);
r(loc1)=0;
g(loc1)=0;
b(loc1)=0;
r(loc)=255;
g(loc)=255;
b(loc)=255;
new=cat(3,r,g,b);
BW = im2bw(new);
ComplementImage=imcomplement(BW);
HolesClearedImage = imfill(ComplementImage,'holes');
measurements = regionprops(HolesClearedImage, 'Centroid', 'Area');
yellow = length(measurements);

%% count orange skittles
loc = find(o==0);
loc1 = find(o==1);
r(loc1)=0;
g(loc1)=0;
b(loc1)=0;
r(loc)=255;
g(loc)=255;
b(loc)=255;
new=cat(3,r,g,b);
BW = im2bw(new);
ComplementImage=imcomplement(BW);
HolesClearedImage = imfill(ComplementImage,'holes');
measurements = regionprops(HolesClearedImage, 'Centroid', 'Area');
orange = length(measurements);

%% annotate original image with count
%use strings to display skittle counts on image
figure
strr = ['Red: ',num2str(red)];
strg = ['Green: ',num2str(green)];
stry = ['Yellow: ',num2str(yellow)];
strp = ['Purple: ',num2str(purple)];
stro = ['Orange: ',num2str(orange)];
pos = [50 50; 50 120; 50 190; 50 260; 50 330];
count = {strr strg stry strp stro};
for ii=1:5
    text_str(ii) = [count(ii)];
end
RGB = insertText(m,pos,text_str, 'FontSize', 60);
imshow(RGB)