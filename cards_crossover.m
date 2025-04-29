function kids = cards_crossover(parents,~,~,~,~,pop)
% Three‑point shuffle between the three piles

    nKids = numel(parents)/2;
    kids  = cell(nKids,1);
    idx   = 1;

    for k = 1:nKids
        parent = pop{parents(idx)};   % we take only the first of the pair
        idx    = idx + 2;

        % Pick **one** random card index out of each 5‑card pile
        id1 = randi([1 5]);
        id2 = randi([6 10]);
        id3 = randi([11 15]);

        sel = [id1, id2, id3];
        sel = sel(randperm(3));       % shuffle indices

        child       = parent;
        child(id1)  = parent(sel(1));
        child(id2)  = parent(sel(2));
        child(id3)  = parent(sel(3));

        kids{k} = child;
    end
end