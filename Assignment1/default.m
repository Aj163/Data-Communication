	%DEFAULT 
	%Default Graph Plotter
	% 
	%default(X_coordinates,Y_coordinates_Polar,Y_coordinates_BiPolar,number_of_bits,input_streat_bits)
	%
	%takes the mentioned parameters and plots Polar RZ and Bipolar Pseudoternary Graphs.
	%
	%RETRUN VALUE:- 
	%		1 if successfull
	%		0 if failed 
	


function isDefaultPlotted = default(x,y1,y2,n,stream_bits)
	

	isDefaultPlotted = 0;
	
	% Plotting Polar RZ --------------------------------------------
	

	subplot(2, 2, 1)
	plot(x, y1)
	axis([-0.1, n+0.7*n, -1.2, 1.7])
	xlabel('Time (sec)')
	ylabel('Amplitude')
	title('Polar RZ (Default)')

	% Printing info
	text(n+0.2, 1.0, 'r = 0.5')
	text(n+0.2, 0.5, 'Bit Rate = 1.0 bps')
	text(n+0.2, 0.0, 'Baud Rate = 1.0 baud')
	text(n+0.2, -0.5, 'Bandwidth = 1.0 bps')

	for i = 0:(n-1)
		text(i+0.5, 1.2, stream_bits(i+1))
	end


	% Plotting Bipolar Pseudoternary -------------------------------
	
	subplot(2, 2, 3)
	plot(x, y2)
	axis([-0.1, n+0.7*n, -1.2, 1.7])
	xlabel('Time (sec)')
	ylabel('Amplitude')
	title('Bipolar Pseudoternary (Default)')

	% Printing info
	text(n+0.2, 1.0, 'r = 1.0')
	text(n+0.2, 0.5, 'Bit Rate = 1.0 bps')
	text(n+0.2, 0.0, 'Baud Rate = 0.5 baud')
	text(n+0.2, -0.5, 'Bandwidth = 0.5 bps')

	for i = 0:(n-1)
		text(i+0.5, 1.2, stream_bits(i+1))
	end

	isDefaultPlotted = 1;
end