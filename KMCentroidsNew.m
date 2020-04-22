function[B]=KMCentroidsNew(gesturesD, assignedCentroids, Centroids)
   
    for i=1:size(Centroids,1)%8
        
        %tomo la muestra en una nueva matriz
        centroidK=gesturesD;
        %la columna 19 es para el centroide
        centroidK(:,19)=assignedCentroids==i;
        %hago un indice para el centroide K
        indK=centroidK(:,19)==1;
        %la matriz AK tiene solo las muestras del centroide K
        AK=centroidK(indK,:);
        
        for j=1:size(Centroids,2)%18
            %se promedian los centroides nuevos con cada columna de las
            %muestras asignadas
            meanJ(j)=mean(AK(:,j));
            CentroidsNew(i,j)=meanJ(j);
        end
        
    end
    B=CentroidsNew;
end