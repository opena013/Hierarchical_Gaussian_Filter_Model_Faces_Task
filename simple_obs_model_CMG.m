function [logp, yhat, res] = simple_obs_model_CMG(r, infStates, ptrans)
% Calculates the log-probabilities of the inputs given the current prediction
%
% --------------------------------------------------------------------------------------------------
% Copyright (C) 2012-2016 Christoph Mathys, TNU, UZH & ETHZ
%
% This file is part of the HGF toolbox, which is released under the terms of the GNU General Public
% Licence (GPL), version 3. You can redistribute it and/or modify it under the terms of the GPL
% (either version 3 or, at your option, any later version). For further details, see the file
% COPYING or <http://www.gnu.org/licenses/>.

% Initialize returned log-probabilities as NaNs so that NaN is
% returned for all irregualar trials
n = size(infStates,1);
logp = NaN(n,1);
yhat = NaN(n,1);
res  = NaN(n,1);

% Weed irregular trials out from inputs and predictions
%
% Participant responses
y = r.y(:,1);
y(r.irr) = [];

% Predictions
x = infStates(:,1,1);
x(r.irr) = [];

% Calculate log-probabilities for non-irregular trials
reg = ~ismember(1:n,r.irr);
logp(reg) = y.*log(x) + (1-y).*log(1-x);
yhat(reg) = y.*(x) + (1-y).*(1-x); % not fully sure this is correct. may want to just exponentiate log probs instead
res(reg) = (y-x)./sqrt(x.*(1-x));

return;
