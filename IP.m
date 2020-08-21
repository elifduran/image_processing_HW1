original_image = imread('1.tif');
subplot(3,2,1);
imshow(original_image);
subplot(3,2,2);
imhist(original_image,256);

image = imread('1.tif');
row = size(image,1);
column = size(image,2);
numberOfPixel = row * column;

histogramImage=uint8(zeros(row,column));
frequency = zeros(256,1);
probabilityOfFrequency = zeros(256,1);
cumulative = zeros(256,1);
probabilityOfCumulative = zeros(256,1);
output = zeros(256,1);

for i=1:row
    for j=1:column
        value=image(i,j);
        frequency(value+1)=frequency(value+1)+1;
        probabilityOfFrequency = frequency(value+1)/numberOfPixel;
    end
end

sum=0;

for i=1:size(frequency)
   sum=sum+frequency(i);
   cumulative(i)=sum;
   probabilityOfCumulative(i)= cumulative(i)/numberOfPixel;
   output(i)=round(probabilityOfCumulative(i)*255);
end

for i=1:row
    for j=1:column
            histogramImage(i,j)=output(image(i,j)+1);
    end
end

subplot(3,2,3);
imshow(histogramImage);
subplot(3,2,4);
imhist(histogramImage);


input_image = imread('1.tif');
subplot(3,2,5);
A = histeq(input_image);
imshow(A);
subplot(3,2,6);
imhist(A);


