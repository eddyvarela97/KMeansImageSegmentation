clear
clc
%Código base para su tarea:

%function NI=k_meansIA(k, image, w)

%k es el num de clusters
%image es la imagen a analizar. El nombre deberá recibirse entre apóstrofes 'NombreDeArchivo.tiff '
% Este ser? el peso de la posici?n en x, y.

%k_means(k, 'Tiger1.tiff', 0)
K=input('Number of clusters: ');
W=input('Weight for the image: ');
tic;
I1=imread('tigre.jpg');
s=size(I1);
I=zeros(s(1), s(2), s(3));
% Convertir la imagen a modo matriz 3D
I(:,:,1)= I1(:,:,1);
I(:,:,2)= I1(:,:,2);
I(:,:,3)= I1(:,:,3);

s=size(I);
new_image=zeros(s);
num_rows= s(1);
num_cols=s(2);
num_elems = num_rows * num_cols;

% Crear la matriz de Features
Features = KMFeatures(I, num_rows, num_cols);


% normalizar Features
[FeaturesNorm,maxValue]=KMNormalizeMatrix(Features);
%[Feature_Norm] = normalize_matrix(Features);

[FeaturesWeighted,WC] = KMWeight(FeaturesNorm,W);

%Inicializar centroides. Elijan k centroides al azar
Centroids= KMInitializeCentroids(FeaturesWeighted, K);
%centroids = init_centroids(Feature_Norm, k);

%K-means
[GroupedMatrix,CentroidsNew]= KMeans(FeaturesWeighted,Centroids);

% Aquí va su código para ejecutar KMeans. Por lo pronto se requiere hacer
% lo necesario para tener un vector con la predicción (Assign) que
% contenga el número de cluster para cada uno de los pixeles.
  s=size(I);
    % crear una matriz del mismo tamaño que I
    c=0;
    new_image=zeros(s);
    for i=1:num_rows
        for j=1:num_cols
            c=c+1;
            finalMatrix(i,j)=GroupedMatrix(c,1);
        end
    end
    maxValue=maxValue/WC;
    for i=1:K
        for j=3:5
            centroidsFinal(i,j-2)=CentroidsNew(i,j)*maxValue(j);
            %centroidsFinal(i,j-2)=CentroidsNew(i,j)*maxValueWeighted(j);
        end
    end
    % Para cada cluster generaremos un mapa (o máscara) para que nos
    % regrese una matriz con 1 en los pixeles que correspondan a ese
    % cluster
    % después supliremos los valores de r g b por los valores del cluster
    % al que pertenece cada pixel.

    %CREAR FUNCION QUE DETECTE EL NUMERO Y LO PONGA EN UNA COLUMNA NUEVA DE LA
    %MISMA CANTIDAD DE ROWS
    test1=finalMatrix==1;
    suma=sum(test1);
    suma=suma';
    
    for i=1:K
    mask = (finalMatrix ==i);
    new_image(:,:,1) = new_image(:,:,1) + (mask.* centroidsFinal(i, 1));
    new_image(:,:,2) = new_image(:,:,2) + (mask.* centroidsFinal(i, 2));
    new_image(:,:,3) = new_image(:,:,3) + (mask.* centroidsFinal(i, 3));
    end

    NI=uint8(new_image);
    figure(1);
    imshow(NI);
    toc;
%end