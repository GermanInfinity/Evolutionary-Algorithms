%Decode function
function dec = decodee(x)
    upp = 2; low = -1; l = 12;
    dec_store = zeros(1, 30);
    for i = 1:12
        dec_store(i) = (int16(x(i)) - 48) * (2^(12 - i));
        
    end
    dec = ((sum(dec_store) / (2^l)) * (upp - low)) + low;
end