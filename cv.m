%Cross over function
%Cross over parents index
function [child1, child2] = cv(pool, rnd_cv, rnd_cv2)
    paren1 = pool(rnd_cv);
    paren2 = pool(rnd_cv2);
    bit_paren1 = encodee(paren1);
    bit_paren2 = encodee(paren2);
%Can index through bitcv(pp_paren1
    bit_child1 = horzcat(bit_paren1(1:6), bit_paren2(6:11));
    bit_child2 = horzcat(bit_paren1(6:11), bit_paren2(1:6));
%Have to decode
    child1 = decodee(bit_child1);
    child2 = decodee(bit_child2);
end
