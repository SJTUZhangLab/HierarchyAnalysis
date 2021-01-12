%% iteration of hierarchy scores

% for CC only
hs = hs_anatomy_CC;
yname = NameROI(isC);
[~, oo] = sort(hs(end,:), 'descend');
colorlist = rand(size(hs,2), 3);

figure; set(gcf, 'Position', [100, 100, 800, 800]);
hold on;
for nn = 1:1:size(hs,2)
    plot(hs(:,oo(nn)), 'Color', colorlist(nn,:), 'LineWidth', 1.2);
end
legend(yname(oo), 'Location', 'BestOutside', 'FontSize', 10);
legend('boxoff');
ylabel('Hierarchy score');
xlabel('Iteration (#)');
title('CC only');

% for TC only
hs = hs_anatomy_TC;
yname = NameROI;
[~, oo] = sort(hs(end,:), 'descend');
colorlist = rand(size(hs,2), 3);

figure; set(gcf, 'Position', [100, 100, 800, 800]);
hold on;
for nn = 1:1:size(hs,2)
    plot(hs(:,oo(nn)), 'Color', colorlist(nn,:), 'LineWidth', 1.2);
end
legend(yname(oo), 'Location', 'BestOutside', 'FontSize', 10);
legend('boxoff');
ylabel('Hierarchy score');
xlabel('Iteration (#)');
title('TC only');

% for CC+TC
hs = hs_anatomy_CCxTC;
yname = NameROI;
[~, oo] = sort(hs(end,:), 'descend');
colorlist = rand(size(hs,2), 3);

figure; set(gcf, 'Position', [100, 100, 800, 800]);
hold on;
for nn = 1:1:size(hs,2)
    plot(hs(:,oo(nn)), 'Color', colorlist(nn,:), 'LineWidth', 1.2);
end
legend(yname(oo), 'Location', 'BestOutside', 'FontSize', 10);
legend('boxoff');
ylabel('Hierarchy score');
xlabel('Iteration (#)');
title('CC+TC');


%% iteration of global hierarchy score
figure; hold on;
plot(ghs_anatomy_CC, 'LineWidth', 1.5);
plot(ghs_anatomy_TC, 'LineWidth', 1.5);
plot(ghs_anatomy_CCxTC, 'LineWidth', 1.5);
legend({'CC only', 'TC only', 'CCxTC'}, 'Location', 'BestOutside');
ylabel('Global hierarchy score');
xlabel('Iteration (#)');
set(gca, 'YLim', [0.75,0.95], 'YTick', [0.75:0.05:0.95]);
    

%% hierarchy score
outlist = {'hs_anatomy_CC', 'hs_anatomy_TC', 'hs_anatomy_CCxTC'};
yname = NameROI;
xname = {'CC only', 'TC only', 'CC+TC'};

hiersum = nan(length(yname), length(xname));
for nn = 1:1:length(outlist)
    eval(sprintf('tmp = %s(end,:);', outlist{nn}))
    hiersum(1:length(tmp), nn) = tmp;
end
[~, oo] = sort(hiersum(:,end));
colorlist = rand(size(hiersum,1), 3);

figure; set(gcf, 'Position', [100, 100, 600, 600]);
hold on;
for nn = 1:1:size(hiersum, 2)
    plot(hiersum(oo,nn), (1:1:length(yname))', 'o', 'MarkerEdgeColor', colorlist(nn,:), 'MarkerFaceColor', colorlist(nn,:), 'MarkerSize', 8);
end
set(gca, 'YLim', [0, length(yname)+1], 'YTick', (1:1:length(yname)), 'YTickLabel', yname(oo), 'XLim', [-1.2, 1.2], 'FontSize', 12);
legend(xname, 'Interpreter', 'none', 'Location', 'SouthEast', 'FontSize', 12);


%% distribution of shuffled global hierarchy score

figure; hold on;
histogram(ghs_anatomy_CC_shuffle_CC(end,:), 0:0.02:1, 'EdgeColor', [0.3,0.8,0.3], 'FaceColor', [0.3,0.8,0.3], 'LineWidth', 0.1, 'FaceAlpha', 1, 'EdgeAlpha', 1);
histogram(repmat(ghs_anatomy_CC(end), 100, 1), 0:0.02:1, 'FaceColor', [0.3,0.3,0.3], 'FaceAlpha', 1, 'EdgeAlpha', 1);
legend({'CC shuffled', 'CC observed'}, 'Location', 'NorthWest');
set(gca, 'XLim', [0,1], 'TickDir', 'out');
xlabel('Global hierarchy score (z-scored)');
ylabel('Frequency');

figure; hold on;
histogram(ghs_anatomy_TC_shuffle_TC(end,:), 0:0.02:1, 'EdgeColor', [0.3,0.8,0.3], 'FaceColor', [0.3,0.8,0.3], 'LineWidth', 0.1, 'FaceAlpha', 1, 'EdgeAlpha', 1);
histogram(repmat(ghs_anatomy_TC(end), 100, 1), 0:0.02:1, 'FaceColor', [0.3,0.3,0.3], 'FaceAlpha', 1, 'EdgeAlpha', 1);
legend({'TC shuffled', 'TC observed'}, 'Location', 'NorthWest');
set(gca, 'XLim', [0,1], 'TickDir', 'out');
xlabel('Global hierarchy score (z-scored)');
ylabel('Frequency');

figure; hold on;
histogram(ghs_anatomy_CCxTC_shuffle_CC(end,:), 0:0.02:1, 'EdgeColor', [0.3,0.8,0.3], 'FaceColor', [0.3,0.8,0.3], 'LineWidth', 0.1, 'FaceAlpha', 1, 'EdgeAlpha', 1);
histogram(ghs_anatomy_CCxTC_shuffle_TC(end,:), 0:0.02:1, 'EdgeColor', [0.3,0.3,0.8], 'FaceColor', [0.3,0.3,0.8], 'LineWidth', 0.1, 'FaceAlpha', 1, 'EdgeAlpha', 1);
histogram(ghs_anatomy_CCxTC_shuffle_CCxTC(end,:), 0:0.02:1, 'EdgeColor', [0.8,0.3,0.3], 'FaceColor', [0.8,0.3,0.3], 'LineWidth', 0.1, 'FaceAlpha', 1, 'EdgeAlpha', 1);
histogram(repmat(ghs_anatomy_CCxTC(end), 100, 1), 0:0.02:1, 'FaceColor', [0.3,0.3,0.3], 'FaceAlpha', 1, 'EdgeAlpha', 1);
legend({'CC shuffled', 'TC shuffled', 'CC+TC shuffled', 'CC+TC observed'}, 'Location', 'NorthWest');
set(gca, 'XLim', [0,1], 'TickDir', 'out');
xlabel('Global hierarchy score (z-scored)');
ylabel('Frequency');

