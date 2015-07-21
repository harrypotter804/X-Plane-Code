function [ output_args ] = xplanetranslate( Input )
%XPLANETRANSLATE
% xplanetranslate( input_args ) is a function to translate the necessary
% informations from X-Plane, the most advanced flight simulator in the world.
% Translate those informations from binay to dec. Hope it will helpful.
format short

Mantissa = Input( 10:32 );
Significand = 1;
Exponent = bin2dec( Input( 2:9 ) ) - 127;
for i = 1: 1: length( Mantissa )
    Significand = Significand + str2num( Mantissa( 1, i ) ) * 2^( -1 * i );
end

if ( str2num( Input(1) ) == 1 )
    
    TrunValue = -1*Significand * 2^Exponent;

else
    
    TrunValue = Significand * 2^Exponent;

end
output_args = TrunValue;

end