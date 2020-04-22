function F= KMFeatures(I, num_rows, num_cols)
%clear
%clc
    %load('TigerWorkKMFeatures1');
    numberOfPixels=num_rows*num_cols;
    matrixOfFeatures=zeros(numberOfPixels,5);%85904
    pixelCounter=0;
    rowCounter=0;   
    for i=1:num_rows  
        rowCounter=rowCounter+1;
        colCounter=0;
        for j=1:num_cols
            colCounter=colCounter+1;
            pixelCounter=pixelCounter+1;
            %red
            matrixOfFeatures(pixelCounter,3)=I(i,j,1);
            %green
            matrixOfFeatures(pixelCounter,4)=I(i,j,2);
            %blue
            matrixOfFeatures(pixelCounter,5)=I(i,j,3);
            %x
            matrixOfFeatures(pixelCounter,1)=rowCounter;
            matrixOfFeatures(pixelCounter,2)=colCounter;      
        end
    end
    F=matrixOfFeatures;
end