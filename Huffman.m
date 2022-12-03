clear all;
close all;
clc;

%Abrimos la imagen
img=imread('IMG/1.jpg');
%Convertir a escala de grises y mostramos
img=rgb2gray(img);
figure
imshow(img)