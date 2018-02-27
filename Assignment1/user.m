	%USER
	%Graph Plotter for User's Choice
	%
	%user(X_coordinates,Y_coordinates_Polar,Y_coordinates_BiPolar,number_of_bits,user_input_bit_rate_for_Polar,user_input_bit_rate_for_BiPolar,input_streat_bits)
	%
	%takes the mentioned parameters and plots Polar RZ and Bipolar Pseudoternary Graphs for the User inputs.
	%
	%RETRUN VALUE:- 
	%		1 if successfull
	%		0 if failed 



function isUserChoicePlotted = user(x,y1,y2,n,fs,bit_rate1,bit_rate2,stream_bits)
	

	isUserChoicePlotted = 0;
	
	% Plotting Polar RZ --------------------------------------------

	% X values
	for i = 0:(n*fs)
		x(i+2) = i/fs/bit_rate1;
	end

	subplot(2, 2, 2)
	plot(x, y1)
	axis([-0.1, n/bit_rate1+0.7*n/bit_rate1, -1.2, 1.7])
	xlabel('Time (sec)')
	ylabel('Amplitude')
	title('Polar RZ (User choice)')

	% Printing info
	text(n/bit_rate1+0.2/bit_rate1, 1.0, 'r = 0.5')
	text(n/bit_rate1+0.2/bit_rate1, 0.5, strcat(strcat('Bit Rate = ', num2str(bit_rate1)), ' bps'))
	text(n/bit_rate1+0.2/bit_rate1, 0.0, strcat(strcat('Baud Rate = ', num2str(bit_rate1)), ' baud'))
	text(n/bit_rate1+0.2/bit_rate1, -0.5, strcat(strcat('Bandwidth = ', num2str(bit_rate1)), ' bps'))

	for i = 0:(n-1)
		text(i/bit_rate1+0.3/bit_rate1, 1.2, stream_bits(i+1))
	end


	% Plotting Bipolar Pseudoternary -------------------------------

	% X values
	for i = 0:(n*fs)
		x(i+2) = i/fs/bit_rate2;
	end

	subplot(2, 2, 4)
	plot(x, y2)
	axis([-0.1, n/bit_rate2+0.7*n/bit_rate2, -1.2, 1.7])
	xlabel('Time (sec)')
	ylabel('Amplitude')
	title('Bipolar Pseudoternary (User choice)')

	% Printing info
	text(n/bit_rate2+0.2/bit_rate2, 1.0, 'r = 1.0')
	text(n/bit_rate2+0.2/bit_rate2, 0.5, strcat(strcat('Bit Rate = ', num2str(bit_rate2)), ' bps'))
	text(n/bit_rate2+0.2/bit_rate2, 0.0, strcat(strcat('Baud Rate = ', num2str(bit_rate2/2)), ' baud'))
	text(n/bit_rate2+0.2/bit_rate2, -0.5, strcat(strcat('Bandwidth = ', num2str(bit_rate2/2)), ' bps'))

	for i = 0:(n-1)
		text(i/bit_rate2+0.3/bit_rate2, 1.2, stream_bits(i+1))
	end

	isUserChoicePlotted = 1;

end
