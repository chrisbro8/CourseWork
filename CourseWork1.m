close all;
clear all;
firstImage=imread('Robot.tif');
Oimag=imread('Oimage.bmp');
figure;
subplot(2,2,1)
imshow(firstImage),title('Original Image');
% first Conversion try
%multiply the spliced colors
% i didnt necessarily need thid ad the image was a binary image+
R=0.2;
G=0.7;
B=0.1;
% it already in grayscale Just saving that...
grayImage=R*firstImage(:,:,1)+G*firstImage(:,:,2)+B*firstImage(:,:,3);
BinaryImage=imbinarize(grayImage);
%The structured Element Conversion
SE1=R*Oimag(:,:,1)+G*Oimag(:,:,2)+B*Oimag(:,:,3);
SE=imbinarize(SE1)
%hit and miss methos
Image_Erode=imerode(BinaryImage,SE)
subplot(2,2,2)
imshow(Image_Erode);
Image_Erode2=imerode(not(BinaryImage),not(SE));
subplot(2,2,3)
imshow(Image_Erode2);
HM=Image_Erode&Image_Erode2;
subplot(2,2,4)
imshow(HM);
getCoordinates(HM)% using my function