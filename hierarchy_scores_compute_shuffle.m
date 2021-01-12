%% load data
HI_ANATOMY_CC = xlsread('.\Connection Data.xlsx', 'HI ANATOMY CC');
HI_ANATOMY_TC = xlsread('.\Connection Data.xlsx', 'HI ANATOMY TC');
HI_ANATOMY_CCxTC = xlsread('.\Connection Data.xlsx', 'HI ANATOMY CC+TC');
HI_EPSP_CC = xlsread('.\Connection Data.xlsx', 'HI EPSP CC');
[~, NameROI] = xlsread('.\Connection Data.xlsx', 'Anatomical Connections', 'A3:A16');
isC = ismember(NameROI, {'VIS', 'PTLp', 'RSP', 'ACA', 'ORB', 'PL/ILA'});


%% HI to hierarchy score & ghs

hi = HI_ANATOMY_CC;
isshuffled = true(size(hi));
[hs_anatomy_CC, ghs_anatomy_CC, hs_anatomy_CC_shuffle_CC, ghs_anatomy_CC_shuffle_CC] = ...
    IterationFunc(hi, 50, 300, isshuffled);

hi = HI_ANATOMY_CCxTC;
isshuffled = isC & isC';
[~, ~, hs_anatomy_CCxTC_shuffle_CC, ghs_anatomy_CCxTC_shuffle_CC] = ...
    IterationFunc(hi, 50, 300, isshuffled);

hi = HI_ANATOMY_CCxTC;
isshuffled = ~isC & isC';
[~, ~, hs_anatomy_CCxTC_shuffle_TC, ghs_anatomy_CCxTC_shuffle_TC] = ...
    IterationFunc(hi, 50, 300, isshuffled);

hi = HI_ANATOMY_CCxTC;
isshuffled = true(size(hi));
[hs_anatomy_CCxTC, ghs_anatomy_CCxTC, hs_anatomy_CCxTC_shuffle_CCxTC, ghs_anatomy_CCxTC_shuffle_CCxTC] = ...
    IterationFunc(hi, 50, 300, isshuffled);

hi = HI_ANATOMY_TC;
isshuffled = ~isC & isC';
[hs_anatomy_TC, ghs_anatomy_TC, hs_anatomy_TC_shuffle_TC, ghs_anatomy_TC_shuffle_TC] = ...
    IterationFunc(hi, 50, 300, isshuffled);

hi = HI_EPSP_CC;
isshuffled = true(size(hi));
[hs_epsp_CC, ghs_epsp_CC, hs_epsp_CC_shuffle_CC, ghs_epsp_CC_shuffle_CC] = ...
    IterationFunc(hi, 50, 300, isshuffled);

hi = sign(HI_ANATOMY_CCxTC);
isshuffled = true(size(hi));
[hs_anatomy_sign_CCxTC, ghs_anatomy_sign_CCxTC, hs_anatomy_sign_CCxTC_shuffle_CCxTC, ghs_anatomy_sign_CCxTC_shuffle_CCxTC] = ...
    IterationFunc(hi, 50, 300, isshuffled, 0);


