function score = cards_fitness(pop)
%   values (the lower, the better) for the population cell array POP

    targetSum1 = 49;
    targetSum2 = 33;
    targetProd = 12600;

    nInd = size(pop,1);
    score = zeros(nInd,1);

    for k = 1:nInd
        g = pop{k};

        % Decode piles
        p1 = g(1:5);
        p2 = g(6:10);
        p3 = g(11:15);

        % Objectives
        d1 = abs(sum(p1)  - targetSum1);
        d2 = abs(sum(p2)  - targetSum2);
        d3 = abs(prod(p3) - targetProd) / targetProd;   % scale product

        score(k) = d1 + d2 + d3;   % minimise combined distance
    end
end