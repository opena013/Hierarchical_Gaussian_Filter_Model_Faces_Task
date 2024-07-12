function c = simple_obs_model_config_CMG
% Config structure
c = struct;

% Gather prior settings in vectors; initialize to null because not needed
c.priormus = [];
c.priorsas = [];

% This is the handle to a dummy function since there are no parameters to transform
c.transp_obs_fun = @tapas_bayes_optimal_binary_transp;
c.obs_fun = @simple_obs_model_CMG;
c.model = 'simple_obs_model_CMG';
return;