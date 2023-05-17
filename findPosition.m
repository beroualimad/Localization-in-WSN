function [estimatedPosition] = findPosition_2(unknownNodePosition, beaconInRange)
    popSize = 30 ; % size of population will create
    maxIteration = 1000 ; % maximum number of iteration
    xMin = 0 ; % minimum value of x
    xMax = 50 ; % maximum value of x
    yMin = 0 ; % minimum value of y
    yMax = 50 ; % maximum value of y
    mutationRate = 0.1 ; % mutation rate
    pop = generatePopulation(popSize, xMin, xMax, yMin, yMax) ; % generate population
    fitness = calculateFitness(pop, beaconInRange) ; % calculate fitness of population
    for i = 1 : maxIteration
        pop = selection(fitness) ; % select population
        pop = crossover(pop) ; % crossover population
        pop = mutation(pop, mutationRate, xMin, xMax, yMin, yMax) ; % mutate population
        fitness = calculateFitness(pop, beaconInRange) ; % calculate fitness of population
    end
    estimatedPosition = pop(1, :) ; % return the best individual

end