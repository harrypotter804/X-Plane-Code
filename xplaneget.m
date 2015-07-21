function [ output_args ] = xplaneget( input_args )
%XPLANEGET 
%   xplaneget( input_args ) is a function to get udp informations from
%   X-Plane, the most advanced flight simulator in the world. 

% Declare
ipA = '127.0.0.1';
portA = 49001;
ipB = '127.0.0.1';
portB = 49005;
ipC = '127.0.0.1';
portC = 49002;

u = udp( '127.0.0.1', 49001, 'LocalPort', 49005 );
fopen( u );
A = fread( u );
echoudp('off');
fclose(u);

p = ( length( A ) - 5 ) / 36;

% Divid the input information.
for i = 1: 1: p
    xplanedatas( i, : ) = A( 36*i-35+5 : 36*i+5);
end

% Return the ubformations.
[ output_args ] = xplanedatas;
    
end

