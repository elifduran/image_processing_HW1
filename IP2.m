subplot(3,1,1);
input_image = imread('2.tif');
imshow(input_image);

subplot(3,1,2);
image = imread('2.tif');
image = double(image);
[row,column] = size(image);
new_image= zeros(row,column);
for i= 2:row-1
    for j = 2:column-1
        Y = image(i,j)+image(i,j-1)+ image(i,j+1)+ image(i+1,j+1)+image(i+1,j)+ image(i-1,j-1)+ image(i-1,j-1)+ image(i-1,j)+image(i-1,j+1);
        new_image(i,j) = Y/9;
    end    
end
new_image = uint8(new_image);
imshow(new_image);


subplot(3,1,3);
input_image = imread('2.tif');
h = 1/3*ones(3,1);
H = h*h';
Y = filter2(H,input_image, 'same');
mesh(Y)


