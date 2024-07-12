function [logp, yhat, res] = tapas_condhalluc_obs2(r, infStates, ptrans)
% Calculates the log-probability of response y=1 under the unit-square sigmoid model
% Modified by Carter Goldman to include two extra parameters
% (bounded_h_intensity_sal_mu and bounded_l_intensity_conf_mu) that
% determine the saliency of high intensity cues and the confusion of low
% intensity cues, respectively
% --------------------------------------------------------------------------------------------------
% Copyright (C) 2016 Christoph Mathys, TNU, UZH & ETHZ
%
% This file is part of the HGF toolbox, which is released under the terms of the GNU General Public
% Licence (GPL), version 3. You can redistribute it and/or modify it under the terms of the GPL
% (either version 3 or, at your option, any later version). For further details, see the file
% COPYING or <http://www.gnu.org/licenses/>.

% Transform parameters back to their native spaces
be = exp(ptrans(1));
nu = exp(ptrans(2));
h_intensity_sal = 1*(exp(ptrans(3)) + (.75/(1 - .75))) / (exp(ptrans(3)) + (.75/(1-.75) + 1));
l_intensity_conf = .25*(exp(ptrans(4)) + (0/(.25 - 0))) / (exp(ptrans(4)) + (0/(.25-0) + 1));

% Initialize returned log-probabilities as NaNs so that NaN is
% returned for all irregualar trials
n = size(infStates,1);
logp = NaN(n,1);
yhat = NaN(n,1);
res  = NaN(n,1);

% Check input format
if size(r.u,2) ~= 2
    error('tapas:hgf:CondHalluc:InputsIncompatible', 'Inputs incompatible with condhalluc_obs observation model. See tapas_condhalluc_obs_config.m.')
end

% Get perceived true-positive rate corresponding to stimuli
tp = r.u(:,2);

for i = 1:length(tp)
    if tp(i) == 0
        tp(i) = 1 - h_intensity_sal;
    elseif tp(i) == 1
        tp(i) = h_intensity_sal;
    elseif tp(i) == 0.75
        tp(i) = h_intensity_sal - l_intensity_conf;
    elseif tp(i) == 0.25
        tp(i) = 1 - h_intensity_sal + l_intensity_conf;
    end
end


% Weed irregular trials out
mu1hat = infStates(:,1,1);
mu1hat(r.irr) = [];
y = r.y(:,1);
y(r.irr) = [];
tp(r.irr) = [];

% Update belief using precision-weighted prediction error
% with nu the generalized precision
x = mu1hat + 1/(1 + nu)*(tp - mu1hat);

% Calculate log-probabilities for non-irregular trials
reg = ~ismember(1:n,r.irr);
logp(reg) = -log(1+exp(-be.*(2.*x-1).*(2.*y-1)));
yhat(reg) = x;
res(reg) = (y-x)./sqrt(x.*(1-x));

return;
