% first we declare owr basic variables

NumUnkownNodes = 40 ;
distBeaconNodes = 10 ; % the RSSI or the range of beacon nodes 
popSize = 30;
beaconNodes = [5, 10; 18, 26; 15, 30; 20, 35; 25, 25; 30, 40; 35, 14; 40, 20; 42, 10; 50, 5]; % beacon nodes coordinates define from Gps or config manual

numBeaconNodes = length(beaconNodes);
disp(numBeaconNodes);
% define the empty metrix NaN (valeur manquante)
coordinates = NaN(NumUnkownNodes + numBeaconNodes,2);

% Fill the matrix with coordinates of beacon nodes
coordinates(1:numBeaconNodes , :) = beaconNodes;

% Fill the rest of table with random coordinates of unkown nodes
for i = (numBeaconNodes+1) : (numBeaconNodes + NumunkownNodes)
    % genirate the random value
    rowCoord = randi([1, 50]);
    colCoord = randi([1, 50]);
    
    coordinates(i, :) = [rowCoord,colCoord];
end

 
% claculate the distance between beacon nodes and unkown nodes
for i = (numBeaconNodes + 1) : (numBeaconNodes + NumUnkownNodes)
    unknownNodePosition = [];
    beaconInRange = [];
    beaconTabOfUnkownNode = [];
    count = 0 ;
    for j = 1 : numBeaconNodes  
        distance = Distance_Calculation(coordinates(i,:),coordinates(j,:));
        % when the unknown node is within range of the beacon node
        if distance < distBeaconNodes 
            count = count+1;
            beaconTabOfUnkownNode(end+1,:) = [coordinates(j,1),coordinates(j,2)];
        end

        if size(beaconTabOfUnkownNode,1) >= 3
           unknownNodePosition = coordinates(i,:);
           beaconInRange = beaconTabOfUnkownNode;
        end
    end
    outputStr = sprintf('Unknown node position: %s\nBeacon in range: %s', mat2str(unknownNodePosition), mat2str(beaconInRange));
    disp(outputStr);
    if ~isnan(beaconInRange)
       estimatedPosition = findPosition_2(unknownNodePosition, beaconInRange);
       disp(estimatedPosition);
    end
end


