function [hs, ghs, hs_shuffle, ghs_shuffle] = IterationFunc(hi, iter, nshuffle, shuffmatrix, isnorm)

if nargin<2 || isempty(iter)
    iter = 50;
end
if nargin<3 || isempty(nshuffle)
    nshuffle = 0;
end
if nargin<4 || isempty(shuffmatrix)
    shuffmatrix = true(size(hi));
end
if nargin<5 || isempty(isnorm)
    isnorm = true;
end

[hs, ghs] = hs_compute(hi, iter);

if nshuffle==0
    return;
end
rn = size(hi,2);
hs_shuffle = zeros(iter, rn, nshuffle);
ghs_shuffle = zeros(iter, 2, nshuffle);

% shuffle
valmatrix = hi~=0;
for kk = 1:1:nshuffle
    vv = find(valmatrix & shuffmatrix);
    vvr = vv(randperm(length(vv)));
    tmphi = hi;
    tmphi(shuffmatrix) = 0;
    tmphi(vvr) = hi(vv);
    [hs_shuffle(:,:,kk), ghs_shuffle(:,:,kk)] ...
        = hs_compute(tmphi, iter);
end

if isnorm
    ghs = ghs(:,1);
    ghs_shuffle = squeeze(ghs_shuffle(:,1,:));
else
    ghs = ghs(:,2);
    ghs_shuffle = squeeze(ghs_shuffle(:,2,:));
end

end

function [hs, ghs] = hs_compute(hi, iter)
rn = size(hi,2);
hs = zeros(iter+1, rn);
ghs = zeros(iter, 2);
val = hi~=0;
for ii = 2:1:iter+1
    % hierarchy scores
    for rr = 1:1:rn
        input = - hi(:, rr) + hs(ii-1, :)';
        if any(val(:,rr))
            inputs = mean(input(val(:,rr)));
        else
            inputs = 0;
        end
        output = hi(rr, :) + hs(ii-1, :);
        if any(val(rr,:))
            outputs = mean(output(val(rr,:)));
        else
            outputs = 0;
        end
        if any(val(rr,:)) && ~any(val(:,rr))
            inputs = outputs;
        elseif ~any(val(rr,:)) && any(val(:,rr))
            outputs = inputs;
        end
        hs(ii,rr) = (inputs + outputs)/2;
    end
    hs(ii,:) = bsxfun(@minus, hs(ii,:), mean(hs(ii,:)));
    
    % global hierarchy score
    gh = [];
    cn = 1;
    for kk = 1:1:rn
        for jj = 1:1:rn
            if val(kk,jj)
                gh(cn,1) = hs(ii,kk)-hs(ii,jj);
                gh(cn,2) = hi(kk,jj);
                cn = cn+1;
            end
        end
    end
    ghs(ii-1,:) = [corr(gh(:,1), gh(:,2)), mean(gh(:,1).*gh(:,2))];
    
end
hs(1,:) = [];
end