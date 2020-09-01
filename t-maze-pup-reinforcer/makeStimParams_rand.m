function params = makeStimParams()

% MATLAB script to generate table of parameters to be used with the OpenEx
% Project natAppTF_amnoise.
%
% For questions, contact robert.liu@emory.edu
% 
% Please cite:
% Alexander G. Dunlap, Cristina Besosa, Leila M. Pascual, Kelly K. Chong, Hasse Walum, Dorottya B. Kacsoh, Brenda B. Tankeu, Kai Lu, Robert C. Liu (2020) Becoming a better parent: Mice learn sounds that improve a stereotyped maternal behavior, Hormones & Behavior
% https://doi.org/10.1016/j.yhbeh.2020.104779
% and 
% Cristina I. Besosa, Alex G. Dunlap, Kai Lu and Robert C. Liu (2020) Using the Pup Retrieval Instinct as Reinforcement for Efficient Auditory Learning in Mice, MethodsX



trials = 100;

side = zeros(trials,1);
for i = 1:trials
    side(i) = binornd(1,.5); %generate trial side 
    
    % make sure same side is not repeated more than 3 times
    if i > 3
        v1 = side(i-1);
        v2 = side(i-2);
        v3 = side(i-3);
        if v1 == v2 & v1 == v3
            side(i) = ~v1;
        end
    end
end



% create volume vector
for i = 1:20
    
    Vol(:,i) = randperm(5)*.2*(.5); %min vol = .2
%     Vol(:,i) = (randperm(5)-1)*.2; % min vol = 0
    
end
Vol = Vol(:);

params = [side, Vol];
params(:,3) = 40e3;
params(:,4) = 20e3;
params(:,5) = 5;

