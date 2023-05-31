function  [] = text_in_audio_decrypt(chars, audio_output)

input_audio = audio_output;

% Get height and width for traversing through the image
len_output = length(input_audio);



% Number of bits in the message
message_length = chars * 8;

% counter to keep track of number of bits extracted
counter = 1;

% Traverse through the image
for i = 1 : len_output
		
    % If more bits remain to be extracted
    if (counter <= message_length)

        % Store the LSB of the pixel in extracted_bits
        extracted_bits(counter) = mod(double(input_audio(i)), 2);

        % Increment the counter
        counter = counter + 1;
    end
end

% Powers of 2 to get the ASCII value from binary
binValues = [ 128 64 32 16 8 4 2 1 ];

% Get all the bits in 8 columned table
% Each row is the bits of the character
% in the hidden text
binMatrix = reshape(extracted_bits, 8,(message_length/8));

% Convert the extracted bits to characters
% by multiplying with powers of 2
textString = char(binValues*binMatrix);

% Print the hidden text
disp(textString);

end