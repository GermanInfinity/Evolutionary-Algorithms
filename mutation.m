%Mutation function
function mutant = mutation(child, pm)
    %Count number of decimals for probability.
    y = pm.*10.^(1:20);
    dec_spots = find(y==round(y),1);
    places = 1;
    for idx = 1:dec_spots
        places = places * 10;
    end
    
    for i = 1:numel(child)
    %Make prob list of 1 - places
        prob_list = int16((places - 1) .* rand(1, places) + 1);
    %Check for pm*places in prob_lis
        for j = 1:places
            if pm*places == prob_list(j)
                if child(i) == '1'
                    child(i) = '0';
                elseif child(i) == '0'
                    child(i) = '1';
                end
            else
                continue
            end
        end
    end
    mutant = child;
end