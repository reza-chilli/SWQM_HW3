lakeVolume = 5 * (10 ^ 7); % m^3
lakeArea = 4 * (10 ^ 6); % m^2
initConcentration = 5 * (10 ^ -3); % ppm or mg/lit or gr/m^3
riverDischarge = 4.5 * (10 ^ 5); % m^3/yr
sedimentRate = 8; % m/yr
populationGrowthRate = 0.15; % 1/yr
calculatedConcentration = zeros(1, 17); % calculate concentration in this array
calculatedConcentration(1) = initConcentration;
eigenValue = (riverDischarge/lakeVolume) + (sedimentRate/(lakeVolume/lakeArea));  % 1/yr

for i = 1:length(calculatedConcentration) - 1
    calculatedConcentration(i+1) = (initConcentration/(eigenValue + populationGrowthRate)) * (exp(populationGrowthRate * (i - 1)) - exp(-eigenValue * (i - 1)));
end
x = 1994:1:2010;
% initiating plot with labels
figure;
plot(x, calculatedConcentration);
xlabel('EOY');
ylabel('Concentration (ppm)');
