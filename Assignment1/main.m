%MAIN
%
% Given a stream of data bits (this is the input), you are required to 
% produce a Polar RZ Signal. Further convert it into Bipolar Pseudoternary.
% Record your observations and obtain the differences between the two 
% schemes in terms of bit rate, baud rate, bandwidth, value of r. 
% Also, you are required to vary the above mentioned parameters and 
% record the results (for eg. increase the bit rate and observe how the 
% waveform changes). Plot graphs to substantiate your recorded observations.

n = input('Enter number of bits : ');
stream_bits = input('Enter the bits (within single quotes ('''')) : ');

% User parameters
bit_rate1 = 0; % Polar RZ
bit_rate2 = 0; % Bipolar Pseoduternary

bit_rate = 0;
baud_rate = 0;
band_width = 0;

ch = input('\nChoose a parameter\n1. Bit Rate\n2. Baud Rate\n3. Bandwidth\nEnter your choice : ');
if ch==1
	bit_rate = input('\nEnter the bit rate : ');
	bit_rate1 = bit_rate;
	bit_rate2 = bit_rate;
elseif ch==2
	baud_rate = input('\nEnter the baud rate : ');
	bit_rate1 = baud_rate;
	bit_rate2 = 2*baud_rate;
elseif ch==3
	band_width = input('\nEnter the bandwidth rate : ');
	bit_rate1 = band_width;
	bit_rate2 = 2*band_width;
else
	fprintf('\nInvalid input... Chosing default values\n');
end

fs = 10000; %step value
x = zeros(1, n*fs +2);
y1 = zeros(1, n*fs +2);
y2 = zeros(1, n*fs +2);

% X values
for i = 0:(n*fs)
	x(i+2) = i/fs;
end

% Y1 values
y1(1) = 0;
y1(n*fs +2) = 0;

for i = 0:(n*fs -1)
	if i/fs - floor(i/fs) >= 0.5
		y1(i+2) = 0;
	else
		if stream_bits(floor(i/fs) +1) - '0' == 0
			y1(i+2) = -1;
		else
			y1(i+2) = 1;
		end
	end
end

% Y2 values
y2(1) = 0;
y2(n*fs +2) = 0;
prev = -1;

for i = 0:(n*fs -1)
	if stream_bits(floor(i/fs) +1) - '0' == 0
		if mod(i,fs) == 0
			if prev == -1
				prev = 1;
			else
				prev = -1;
			end
		end
		y2(i+2) = prev;
	else
		y2(i+2) = 0;
	end
end

default(x,y1,y2,n,stream_bits);
user(x,y1,y2,n,fs,bit_rate1,bit_rate2,stream_bits);