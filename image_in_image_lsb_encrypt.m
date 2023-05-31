function Steganog_image = image_in_image_lsb_encrypt(n,Hidden)
Image = imread('cover.png');
%Hidden = imread('rib.png');

Image=imresize(Image, [260 260]);
Hidden=imresize(Hidden, [260 260]);
if n >=8 || n <=0
    disp('Error: n must be between 1 and 7!');
else
    cmp= bitcmp(2^n - 1, 'uint8');
    b = bitand(Image, cmp);
    b1 =  bitshift(Hidden, n - 8);
    b2=bitor(b,b1);
    Steganog_image = uint8(b2);
end
figure;
imshow(Steganog_image)
title('Steganographic Image')
end