function[A]=KMAssign(gesturesD, CentroidsA)
N=size(gesturesD,1);%633
K=size(CentroidsA,1);%8
for i=1:N
    for j=1:K
        %deltas entre cada gesto de la muestra y el centroide
        distances(i,j)= norm(gesturesD(i,:)-CentroidsA(j,:));
    end 
    distanceMin= min(distances(i,:));
    %se toma la distancia minima
    assignedCentroidT(i)=max(find(distances(i, :)==distanceMin));
end
%se transpone la matriz para facilitar lectura y comparacion
assignedCentroid= assignedCentroidT';
A=assignedCentroid;
end