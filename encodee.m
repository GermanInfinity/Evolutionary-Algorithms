%Encode function
function enc = encodee(x)
    upp = 2; low = -1; l = 12;
    num = ((2^l) - 1)*(x - low) / (upp - low);
    num = ceil(num);
    %Returns string
    enc = dec2base(num, 2);
    
end
