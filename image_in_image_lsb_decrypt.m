function [] = image_in_image_lsb_decrypt(n,Steganog_image)
Extracted = uint8(bitand(255, bitshift(Steganog_image, 8 - n)));

figure;
imshow(Extracted)
title('Extracted Image')
end