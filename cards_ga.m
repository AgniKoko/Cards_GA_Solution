%% Card Genetic Algorithm Solution (Exercise 2)
% This repository contains five MATLAB *.m* files (The output messages are in Greek)
% https://github.com/AgniKoko/Cards_GA_Solution
% ---------------------------------------------------------------
clc; clear;

nCards = 15;
FitnessFcn  = @(x) cards_fitness(x);

opts = optimoptions('ga', 'PopulationType','custom', ...
                          'CreationFcn',  @cards_permutations, ...
                          'CrossoverFcn', @cards_crossover, ...
                          'MutationFcn',  @cards_mutations,  ...
                          'SelectionFcn', @selectionstochunif , ...
                          'FitnessLimit', 0,                ...
                          'Generations',  800,             ...
                          'PopulationSize', 200,            ...
                          'StallGenLimit',1e4, ...
                          'EliteCount', 2, ...
                          'PlotFcn', @gaplotbestf);


[xBest,fval,reason,output] = ga(FitnessFcn,nCards,opts);

%% 1. Check solution
if fval == 0
    disp('Βρέθηκε ακριβής λύση :D')
else
    fprintf('Δεν βρέθηκε ακριβής λύση, error = %g\n',fval)
end

%% 2. Analyze flag
switch reason
    case 1
        disp('Ο GA τερμάτισε επειδή ικανοποιήθηκε το κριτήριο (fval=0).');
    case 0
        disp('Έφτασε το MaxGenerations ή το StallGenLimit χωρίς τέλεια λύση.')
    case -5
        disp('Ο GA σταμάτησε επειδή το fitness δεν βελτιώθηκε σχεδόν καθόλου.')
    otherwise
        fprintf('Reason = %d (https://www.mathworks.com/help/gads/ga.html)\n',reason)
end
    
%% 3. Output
fprintf('\nΣτατιστικά:\n');
fprintf('  Γενεές          : %d\n',   output.generations)
fprintf('  Αξιολογήσεις    : %d\n',   output.funccount)
fprintf('  Καλύτερο σκόρ   : %g\n',   fval)
disp('  Μήνυμα:'); disp(output.message);

disp('──────────────────────────────────────────────────────────')
cards_print([],struct('Population',{xBest},'Score',fval,'Generation',output.generations),[],[]);

function state = cards_print(~,state,~,~)
    [~,bestIdx] = min(state.Score);
    genome = state.Population{bestIdx};

    p1 = genome(1:5);
    p2 = genome(6:10);
    p3 = genome(11:15);

    s1 = sum(p1);
    s2 = sum(p2);
    s3 = prod(p3);

    fprintf('\n— Generation %d —\n',state.Generation);
    fprintf('Pile 1: %s  |  Σ = %d\n', mat2str(p1), s1);
    fprintf('Pile 2: %s  |  Σ = %d\n', mat2str(p2), s2);
    fprintf('Pile 3: %s  |  Π = %d\n', mat2str(p3), s3);

    if s1==49 && s2==33 && s3==12600
        fprintf('✓ Feasible solution found!\n');
    end
end

