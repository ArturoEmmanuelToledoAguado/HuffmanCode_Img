clear all;
close all;
clc;

%Abrimos la imagen
img=imread('IMG/1.jpg');

%Menu
opc=input('Seleccione una opcion\n1.-Imagen a color\n2.-Imagen a escala de grises\n');
if opc==1
    %Mapeamos los 255 colores
    [img,colormap]=rgb2ind(img,255);
elseif opc==2
    %Convertir a escala de grises y mostramos
    img=rgb2gray(img);
else
    disp('Entrada no valida')
end

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

%Valores de una imagen
val=[0:255];

%Diccionario de Huffman
dic=huffmandict(val,prob);

%Convertimos un array a vector
v_size=1;
for k=1:f
    for q=1:c
        nVec(v_size)=img(k,q);
        v_size=v_size+1;
    end
end

%Codificacion de Huffman
huffCode=huffmanenco(nVec,dic);

%Guardado de Información
if opc==1
    save('Datos.mat','huffCode','dic','f','c','opc','colormap');
else
    save('Datos.mat','huffCode','dic','f','c','opc');
end