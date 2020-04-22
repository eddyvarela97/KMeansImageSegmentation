function C= KMInitializeCentroids(FeaturesNorm, K)
    X=size(FeaturesNorm,1);
    aleatorios=randi(X,K,1);
    Centroids=zeros(K,5);
    for i=1:K
        for j=1:5
            Centroids(i,j)=FeaturesNorm(aleatorios(i),j);
        end
    end
    C=Centroids;
end
%tomate1 = 611262 pixeles 10000,300000,600000