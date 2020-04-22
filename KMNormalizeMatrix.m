function [N,MV]= KMNormalizeMatrix(Features)
     c=0;
     for i=1:5
        c=c+1;
        sizeFeatures=size(Features,1);
        maxValue(i)=max(Features(:,i));
        for j=1:sizeFeatures
            FeaturesNorm(j,i)=Features(j,i)/maxValue(i);        
        end
    end
    N=FeaturesNorm;
    MV=maxValue;
end