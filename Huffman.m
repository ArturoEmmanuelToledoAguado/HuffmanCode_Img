clear all;
close all;
clc;

%Abrimos la imagen
img=imread('IMG/1.jpg');
%Convertir a escala de grises y mostramos
img=rgb2gray(img);
figure
imshow(img)

%Tamaño de la imagen
[f,c]=size(img);
Tam=f*c;

%Variables para encontrar la probabilidad
cont=1;
sig=0;

%Calculo de probabilidad acumulada
for i=0:255
    j=img==i;%Preguntamos si el valor de i esta em la matriz de la imagen
    contador(cont)=sum(j(:));%Apariciones
    
    %Matriz de probabilidades
    prob(cont)=contador(cont)/Tam;
    sig=sig+prob(cont);
    Cprob(cont)=sig;
    cont=cont+1;
end

