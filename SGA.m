%%%SGA
%Initialize individuals in domain [-1, 2] and fitness
%Fitness function = xsin(10*pi*x) + 2 
low = -1; upp = 2;
popsize = 10;
maxgen = 10; gen = 0;
pc = 0.8;
pm = 0.01;
pop_fitness = zeros(1, 30);
indi_fitness = zeros(1, 30);

%Individuals
pop = (upp - low) .* rand(1, 10) + low;


store = zeros(40, 10);
%Selection- Main Loop
while gen < maxgen
    accum = zeros(1, 30);
    pool = zeros(1, 30);
%Individuals fitness
    for j = 1:popsize
        pop_fitness(j) = fitness(pop(j));
    end
%Individuals relative fitness
    for j = 1:popsize
        indi_fitness(j) = pop_fitness(j) / sum(pop_fitness);
    end
%RWS
    for j = 1:popsize
        if j < 2
            accum(j) = indi_fitness(j);
        elseif j > 1
            accum(j) = indi_fitness(j) + sum(accum);
        end
    end
   
%Make the pool
    for i = 1:popsize-1
        %Random choice on RWS
        random_guess = rand(1) * 52;
        if random_guess <= accum(i)
            pool(i) = indi_fitness(i);
        elseif random_guess >= accum(i)
            if random_guess <= accum(i + 1) 
                pool(i) = indi_fitness(i);
            else 
                continue
            end
        end
    end
%Do crossover without replacement. 
   cv_index = randperm(popsize);
   offspring = zeros(1, 30);
   mutated_offspring = zeros(1, 30);
   for i = 1:popsize
       if mod(i, 2) == 0          
          [child1, child2] =  cv(pool, cv_index(i-1), cv_index(i));
          offspring(i-1) = child1;
          offspring(i) = child2;
       end
   end
   
   for i = 1:popsize
       %Mutation
       mutated_offspring(i) = mutation(offspring(i), pm);
       %Fitness of mutated offspring / new popluation; 
       new_fit = fitness(mutated_offspring(i));
   end
   pop = mutated_offspring;
   
   %For checking
   for fill = 1:10
       store(i, fill) = pop(fill);
   end
   gen = gen + 1;
end





%%Finish

