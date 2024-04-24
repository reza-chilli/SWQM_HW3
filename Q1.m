lakeVolume = 5 * (10 ^ 7); % m^3
lakeArea = 4 * (10 ^ 6); % m^2
initConcentration = 5 * (10 ^ -3); % ppm or mg/lit or gr/m^3
riverDischarge = 4.5 * (10 ^ 5); % m^3/yr
sedimentRate = 8; % m/yr
populationGrowthRate = 0.15; % 1/yr
producedPhosphorus = zeros(1, 16); % calculate produced phosphorus in ppm from 1995 through 2010 in this array
calculatedConcentration = zeros(1, 16); % calculate concentration in this array
phosphorusDensity = 1820; % kg/m^3 assumed used to calculate sedimantary phosphorus mass
sedimantaryPhosphorus = (lakeArea * sedimentRate * phosphorusDensity * 1000)/(lakeVolume); % ppm/yr

for i = 1:length(calculatedConcentration)
    producedPhosphorus(i) = (0.5 * 250 * (exp(populationGrowthRate * (i - 1))) * 1000)/(lakeVolume);
    calculatedConcentration(i) = initConcentration + producedPhosphorus(i) -  sedimantaryPhosphorus;
    % assuming control volume is well mixed, phosphorus concentration at
    % inflow river is zero, phosphorus concentration at outflow river is
    % simple mean concentration at lake SOY and EOY 
    calculatedConcentration(i) = calculatedConcentration(i) - ((riverDischarge * ((initConcentration + calculatedConcentration(i))/2))/lakeVolume);
    initConcentration = calculatedConcentration(i);
end

x = 1995:1:2010;
plot(x, calculatedConcentration);

