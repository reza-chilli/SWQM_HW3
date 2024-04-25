% 1~lake superior, 2~lake michigan, 3~lake huron, 4~lake erie, 5~lake ontario
loadings = [4000, 6950, 4575, 18150, 6650] * (10 ^ 6); % gr/yr for lake 1 to 5
lakeAreas = [82100, 57750, 59750, 25212, 18960] * (10 ^ 6); % m^2
lakeVolumes = [12000, 4900, 3500, 468, 1634] * (10 ^ 9); % m^3
outFlows = [67, 36, 161, 182, 212] * (10 ^ 9); % m^3/yr
sedimentRate = 14; % m
consts = zeros(5, 1);
for i = 1:length(consts)
    consts(i) = loadings(i)/(outFlows(i) + (sedimentRate * lakeAreas(i)));
end
coefficients = [
    1, 0, 0, 0, 0;
    0, 1, 0, 0, 0;
    -outFlows(1)/(outFlows(3) + (sedimentRate * lakeAreas(3))), -outFlows(2)/(outFlows(3) + (sedimentRate * lakeAreas(3))), 1, 0, 0;
    0, 0, -outFlows(3)/(outFlows(4) + (sedimentRate * lakeAreas(4))), 1, 0;
    0, 0, 0, -outFlows(4)/(outFlows(5) + (sedimentRate * lakeAreas(5))), 1
];
concentrations = coefficients\consts; % or inv(coefficients) * consts
disp(concentrations);
% part b
dueToMichigan = (concentrations(2) * outFlows(2))/(outFlows(4) + (sedimentRate * lakeAreas(4)));
dueToMichiganPercentage = (dueToMichigan/concentrations(4)) * 100;
% disp(dueToMichigan);
disp(dueToMichiganPercentage);
% part c
loadings(3) = 0.5 * loadings(3); % loading at lake Huron is decreased by 50%
loadings(4) = 1.25 * loadings(4); % loading at lake erie is increased by 25%
newConsts = zeros(5, 1);
for i = 1:length(newConsts)
    newConsts(i) = loadings(i)/(outFlows(i) + (sedimentRate * lakeAreas(i)));
end
newConcentrations = coefficients\newConsts; % or inv(coefficients) * consts
disp(newConcentrations);
    
    