function [child1, child2] = two_nos_never_same(pool)
    popsize = 10;%%%%
    rnd_cv = int16(rand(1) * popsize);
    temp = int16(rand(1) * popsize);
    rnd_cv2 = temp;
    child1 = rnd_cv;
    child2 = rnd_cv2;
    while rnd_cv2 == temp
        if temp ~= rnd_cv
        %rnd_cv2 = rnd_cv2;
            temp = -1; 
        elseif temp == rnd_cv
            rnd_cv2 = int16(rand(1) * popsize);
        end
    end