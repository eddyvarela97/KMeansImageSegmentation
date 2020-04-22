function [GM,NC]= KMeans(FeaturesNorm, Centroids)
    contador=0;
    Converges=1;
    %se usan los centroides iniciales
    AssignCentroids= KMAssign(FeaturesNorm,Centroids);

    %mientras el algoritmo no converja
    while(Converges~=0)
        %indica cuantas iteraciones se necesitaron
        contador=contador+1;
        disp(contador);
        CentroidsNew= KMCentroidsNew(FeaturesNorm, AssignCentroids, Centroids);
        AssignCentroids2= KMAssign(FeaturesNorm,CentroidsNew);
        Converges= KMConverges(AssignCentroids,AssignCentroids2, CentroidsNew);
        %se mueven los valores nuevos a la matriz principal 
        AssignCentroids=AssignCentroids2;
    end
    GM=AssignCentroids2;
    NC=CentroidsNew;
    
end