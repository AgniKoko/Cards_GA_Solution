function population = cards_permutations(nVars,FitnessFcn,opts)
% Creates an initial population of random permutations

    totalPop = sum(opts.PopulationSize);
    population = cell(totalPop,1);

    for k = 1:totalPop
        population{k} = randperm(nVars);
    end
end