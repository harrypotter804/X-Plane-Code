function [ spfpn_str ] = xplane_dec_spfpn( dec_value )

fraction_spfpn_dec = [];
fraction = [];

    if (dec_value > 0)
    
        sign = '0'
    
    else
    
        sign = '1'
    
    end    

dec_value = abs( dec_value );

%Found the 2 to 9
exponent = floor( log10( str2num( dec2bin( dec_value ) ) ) ); %Calculate exponent value

exponent_bias_10 = exponent + 127; %Calculate exponent bias value

exponent_bias_2 = dec2bin( exponent_bias_10,8 ) %Translate dec to bin

%Found the 10 to 32
fraction_int = dec2bin( dec_value ); %Calculate bin of int part

fraction_spfpn_int = fraction_int( 2 : length(fraction_int) ) %Get fraction of int part

    %Translate Decimal part to bin and fill to 23 bit
    for i = 1: 23-length(fraction_spfpn_int)
    
    fraction_dec = dec_value - floor( dec_value );

    fraction_dec = fraction_dec*2;

    fraction_spfpn_dec = [ fraction_spfpn_dec num2str( floor( fraction_dec ) ) ] %Array superposition

    dec_value = fraction_dec;

    end

fraction = [ fraction_spfpn_int fraction_spfpn_dec ] %all bin of fraction part

spfpn_str = [ sign exponent_bias_2 fraction ] %Single-precision floating-point format

end