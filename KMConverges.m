function[C]=KMConverges(assignedCentroids, assignedCentroids2,CentroidsNew)
    %se ponen los arreglos en una matriz para facilitar su comparacion
    Comparacion(:,1)=assignedCentroids;
    Comparacion(:,2)=assignedCentroids2;
    %inicializamos el valor convergencia en 0
    convergencia=0;
    
    for i=1:size(CentroidsNew,1)  
        
        %Se copian las muestras asignadas al Centroide i
        mapN=Comparacion(:,1)==i;
        ComparacionN=Comparacion(mapN,:);
        
        %Se hace una suma de los valores, si en toda la columna solo hay
        %un valor para la suma, significa que el algoritmo ha convergido 
        ComparacionN(:,3)=ComparacionN(:,1)+ComparacionN(:,2);
        suma=unique(ComparacionN(:,3));
        
        %si solo hay un valor en toda la columna no se le añade valor a
        %variable convergencia
        if (size(suma) == 1)
          
        else
            convergencia=convergencia+1;
        end
        
    end
    C=convergencia;
end