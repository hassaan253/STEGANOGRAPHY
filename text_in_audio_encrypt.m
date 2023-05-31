function  output = text_in_audio_encrypt(message)

% Read the input audio
AS=audioread('Coldplay - Ink.mp3');

% Resize the image to required size
input = AS(1:(44100*5));

sound(input,44100)
pause(5)

% Length of the message where each character is 8 bits
len = length(message) * 8;

% Get all the ASCII values of the characters of the message
ascii_value = uint8(message);

% Convert the decimal values to binary
bin_message = transpose(dec2bin(ascii_value, 8));

% Get all the binary digits in separate row
bin_message = bin_message(:);

% Length of the binary message
N = length(bin_message);

% Converting the char array to numeric array
bin_num_message=str2num(bin_message);

% Initialize output as input
output = input;

% Get length for traversing through audio
len_audio = length(input);


% Counter for number of embedded bits
embed_counter = 1;

% Traverse through the image
for i = 1 : len_audio
		
        % If more bits are remaining to embed
    if(embed_counter <= len)

        % Finding the Least Significant Bit of the current pixel
        LSB = mod(double(input(i)), 2);

        % Find whether the bit is same or needs to change
        temp = double(xor(LSB, bin_num_message(embed_counter)));

        % Updating the output to input + temp
        output(i) = input(i)+temp;

        % Increment the embed counter
        embed_counter = embed_counter+1;
    end
		
end
pause(2)
sound(output,44100)
end