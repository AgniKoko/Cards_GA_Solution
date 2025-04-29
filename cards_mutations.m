function mutants = cards_mutations(parents,~,~,~,~,~,pop,~)
% Simple swap mutation affecting two random genes

    nMut = numel(parents);
    mutants = cell(nMut,1);

    for k = 1:nMut
        parent = pop{parents(k)};
        swap   = randperm(15,2);

        child          = parent;
        child(swap(1)) = parent(swap(2));
        child(swap(2)) = parent(swap(1));

        mutants{k} = child;
    end
end
