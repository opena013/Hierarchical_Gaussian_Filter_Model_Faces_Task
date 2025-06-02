%%% HGF pipeline main function for Faces Task 2022
function [x, table, processed_table] = hgf_function(str_run, file, rt_model, p_or_r, cb, experiment_mode,perception_model,observation_model)

% make sure both logrt inputs and stim inputs are arrays
if strcmp(str_run,'2')
    test = '-retest';
else
    test = [];
end

    if rt_model
        [processed_table, table] = get_rts(file, p_or_r, experiment_mode);
        if strcmp(str_run, 'dont fit just process behavior')
            x = [];
            return;
        end
        logrts = prep_data_rthgf(table2array(processed_table(:,'response_times')));
        stim_inputs = processed_table.observed;
        
        x = tapas_fitModel(logrts, stim_inputs, ...
                                 'tapas_hgf_binary_config',...
                                 'tapas_logrt_linear_binary_config',...
                                 'tapas_quasinewton_optim_config'); % or optim_config
    else
        [processed_table, table] = get_responses(file, p_or_r,experiment_mode);
        if strcmp(str_run, 'dont fit just process behavior')
            x = [];
            return;
        end

        response = processed_table.response;
        if strcmp(observation_model,'tapas_condhalluc_obs2_config') || strcmp(observation_model,'tapas_condhalluc_obs2_config_CMG')
            input = table2array(processed_table(:, {'observed', 'trial_prediction'}));
        else
            input = processed_table.observed;
        end
        
        
        x = tapas_fitModel_actprob(response, input,...
                            perception_model, ...
                            observation_model, ... % or use tapas_unitsq_sgm_config or simple_obs_model_config_CMG or tapas_condhalluc_obs2_config or tapas_condhalluc_obs2_config_CMG
                            'tapas_quasinewton_optim_config');
    
    end
end

% tapas_bayes_optimal_binary_config