function [popCordoone,error] = calculateFitnessForOne(pop, beacon)
    % calculate the fitness for one individuel
    popCordoone = pop;
    NodeError = zeros(1,2);
    SomeOfErrorsIndividuel = 0;
    for i = 1: size(beacon,1)
        errorForIndividuel = Calculate_Error(pop, beacon(i,:));
        SomeOfErrorsIndividuel = SomeOfErrorsIndividuel + errorForIndividuel; % calculate the sum of all Errors of each Individuel
    end
    error = calcMSE(SomeOfErrorsIndividuel,beacon);

end