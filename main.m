%DSP INTERACTIVE APP

%Choose cover format
disp('T is for text. A is for Audio. I is for image');
x = input( 'Choose cover format: ' );

%Choose hidden message 
y = input( 'Hidden message format :  ' );

%text in audio
if ( y == 'T' && x == 'A')

    % ENCRYPTION   
    % Message to be embedded

    message=input( 'Enter hidden message :  ' );
    encrypted_text_in_audio = text_in_audio_encrypt(message);

    % DECRYPTION
    % for decryption, one should know the length of the message
    % Number of characters of the hidden text
    chars =length(message);
    text_in_audio_decrypt(chars, encrypted_text_in_audio)
    
% text in image
else if ( y == 'T' && x == 'I') 
    
    % Message to be embedded
    message=input( 'Enter hidden message :  ' );
    
    % Number of characters of the hidden text
    chars =length(message);
    
    % ENCRYPTION
    output = text_in_image_encrypt(message);
    
    % DECRYPTION
    text_in_image_decrypt(chars, output)
    
%image in image
else if ( y == 'I' && x == 'I')
        Message = input('Enter hidden image name (.png): ');
        message = imread(Message);
        n = input('Choose a value for the number of bits (0 < n < 8): ');
        
        % ENCRYPTION
        Steganog_image = image_in_image_lsb_encrypt(n,message);
        
        %DECRYPTION
        image_in_image_lsb_decrypt(n,Steganog_image);
     
    end
    end
end