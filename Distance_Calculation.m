/*
* di = √((x - xi)² + (y - yi)²)
* when 
      point1(1) = x , point1(1) = y
      point1(1) = xi , point1(1) = yi
*/
function [distance] = Distance_Calculation(point1, point2)
    distance = sqrt((point1(1)-point2(1))^2 + (point1(2)-point2(2))^2);
end