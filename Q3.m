loadings = [4000, 6950, 4575, 18150, 6650] * (10 ^ 6); % gr/yr for lake 1 to 5
lakeAreas = [82100, 57750, 59750, 25212, 18960] * (10 ^ 6); % m^2
lakeVolumes = [14000, 4900, 3500, 486, 1634] * (10 ^ 9); % m^3
lakeOutflows = [67, 36, 161, 192, 212] * (10 ^ 9); % m^3/yr
sedimentRate = 16; % m
lakeConcentrations = zeros(1, 5); % calculate concentration at each lake at steady state in this array (ppm)

for i = 1:length(lakeConcentrations)
    lakeConcentrations(i) = loadings(i)/(lakeOutflows(i) + (sedimentRate * lakeAreas(i)));
    switch i
        case 3
            lakeConcentrations(i) = lakeConcentrations(i) + (lakeConcentrations(1) * lakeOutflows(1)) / (lakeOutflows(i) + (sedimentRate * lakeAreas(i))) + (lakeConcentrations(2) * lakeOutflows(2)) / (lakeOutflows(i) + (sedimentRate * lakeAreas(i))); 
        case 5
            lakeConcentrations(i) = lakeConcentrations(i) + (lakeConcentrations(3) * lakeOutflows(3)) / (lakeOutflows(i) + (sedimentRate * lakeAreas(i))) + (lakeConcentrations(4) * lakeOutflows(4)) / (lakeOutflows(i) + (sedimentRate * lakeAreas(i))); 
        otherwise
            % do nothing
    end
end

disp(lakeConcentrations);
% part b

dueToLakeOne = (lakeConcentrations(1) * lakeOutflows(1))/(lakeOutflows(5) + (sedimentRate * lakeAreas(5)));
dueToLakeFour = (lakeConcentrations(4) * lakeOutflows(4))/(lakeOutflows(5) + (sedimentRate * lakeAreas(5)));
percentageDueToLakeOne = (dueToLakeOne / lakeConcentrations(5)) * 100;
percentageDueToLakeFour = (dueToLakeFour / lakeConcentrations(5)) * 100;
disp(dueToLakeOne);
disp(dueToLakeFour);
disp(percentageDueToLakeOne);
disp(percentageDueToLakeFour);