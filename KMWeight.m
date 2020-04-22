function [FW,WC]= KMWeight(FeaturesNorm,W)
    FeaturesWeighted=FeaturesNorm;
    if W>0
        WP= W;
        WC=1-W;
        for i=1:2
            FeaturesWeighted(:,i)=FeaturesNorm(:,i)*WP;
            %maxValueWeighted(i)=max(FeaturesWeighted(i));
            %MaxValueWeighted(:,i)=MaxValue*.75;
        end
        for i=3:5
            FeaturesWeighted(:,i)=FeaturesNorm(:,i)*WC;
            %maxValueWeighted(i)=max(FeaturesWeighted(i));
            %MaxValueWeighted(:,i)=MaxValue*.25;
        end

        FW=FeaturesWeighted;
        WC=WC;
       % MVW=MaxValueWeighted;
    else
        FW=FeaturesNorm;
        WC=1;
    end
end