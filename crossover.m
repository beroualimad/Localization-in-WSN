
function [pop] = crossover(pop)
    for i = 1:2:length(pop)
        %rand = randi(10)/10;    
        %if rand < p_mut
        %    pop(i).x = mutation(pop(i).x);
        %end
        parent1 = pop(1,:);
       % disp(parent1);
        parent2 = pop(2,:);
       % disp(parent2);
        % generate offspring using uniform crossover
        mask = randi([0 1],1,size(parent1,2));
        % child1 = parent1.*mask + parent2.*(1-mask);
        % child2 = parent2.*mask + parent1.*(1-mask);
        child1 = [parent1(1,1) , parent2(1,1)];
        child2 = [parent1(1,1) , parent2(1,2)];
        child3 = [parent1(1,2) , parent2(1,1)];
        child4 = [parent1(1,2) , parent2(1,2)];
       % disp(child1);
        
        %if rand < 0.8
        %    [pop(i).x, pop(i+1).x] = crossover2(pop(i).x, pop(i+1).x);
        %end
        
        pop(1,:) = child1;
        pop(2,:) = child2;
        pop(3,:) = child3;
        pop(4,:) = child4;
    end
end

/*
**** this is another way to specify the child's *****
function [pop] = crossover(pop)
    for i = 1:2:length(pop)
        parent1 = pop(1,:);
        parent2 = pop(2,:);
        % generate offspring using uniform crossover
        mask = randi([0 1],1,size(parent1,2));
        child1 = parent1.*mask + parent2.*(1-mask);
        child2 = parent2.*mask + parent1.*(1-mask);
    
       
    end
end


*/