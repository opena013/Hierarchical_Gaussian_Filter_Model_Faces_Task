function sub_table = faces_model_free(root, cb, experiment_mode, resp_table, predict_table)

   % Add schedule to get intensity/expectation for each trial
            schedule = readtable([root 'rsmith/lab-members/cgoldman/Wellbeing/emotional_faces/schedules/emotional_faces_CB1_schedule_claire.csv']);
            schedule_cb = readtable([root 'rsmith/lab-members/cgoldman/Wellbeing/emotional_faces/schedules/emotional_faces_CB2_schedule_claire.csv']);
            if strcmp(cb, "1")
                resp_table.intensity = schedule.intensity;
                resp_table.expectation = schedule.expectation;
                resp_table.prob_hightone_sad = schedule.prob_hightone_sad;
            else
                resp_table.intensity = schedule_cb.intensity;
                resp_table.expectation = schedule_cb.expectation;
                resp_table.prob_hightone_sad = schedule_cb.prob_hightone_sad;
            end
            
            
         
            sub_table.cor_trials =  sum(strcmp(resp_table.result, 'correct'));
            
            
            % RESPONSES
            matching_rows = strcmp(resp_table.result, 'correct');
            sub_table.r_cor_sad_high_expected_high_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'high') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'sad_high'));
            sub_table.r_cor_sad_high_expected_low_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'low') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'sad_high'));
            sub_table.r_cor_sad_high_unexpected_high_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'high') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'sad_high'));
            sub_table.r_cor_sad_high_unexpected_low_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'low') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'sad_high'));
            sub_table.r_cor_sad_low_expected_high_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'high') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'sad_low'));
            sub_table.r_cor_sad_low_expected_low_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'low') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'sad_low'));
            sub_table.r_cor_sad_low_unexpected_high_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'high') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'sad_low'));
            sub_table.r_cor_sad_low_unexpected_low_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'low') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'sad_low'));
            sub_table.r_cor_angry_high_expected_high_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'high') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'angry_high'));
            sub_table.r_cor_angry_high_expected_low_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'low') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'angry_high'));
            sub_table.r_cor_angry_high_unexpected_high_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'high') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'angry_high'));
            sub_table.r_cor_angry_high_unexpected_low_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'low') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'angry_high'));
            sub_table.r_cor_angry_low_expected_high_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'high') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'angry_low'));
            sub_table.r_cor_angry_low_expected_low_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'low') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'angry_low'));
            sub_table.r_cor_angry_low_unexpected_high_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'high') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'angry_low'));
            sub_table.r_cor_angry_low_unexpected_low_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'low') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'angry_low'));
            
            sub_table.num_sad_high_expected_high_intensity = sum(strcmp(resp_table.intensity, 'high') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'sad_high'));
            sub_table.num_sad_high_expected_low_intensity = sum(strcmp(resp_table.intensity, 'low') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'sad_high'));
            sub_table.num_sad_high_unexpected_high_intensity = sum(strcmp(resp_table.intensity, 'high') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'sad_high'));
            sub_table.num_sad_high_unexpected_low_intensity = sum(strcmp(resp_table.intensity, 'low') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'sad_high'));
            sub_table.num_sad_low_expected_high_intensity = sum(strcmp(resp_table.intensity, 'high') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'sad_low'));
            sub_table.num_sad_low_expected_low_intensity = sum(strcmp(resp_table.intensity, 'low') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'sad_low'));
            sub_table.num_sad_low_unexpected_high_intensity = sum(strcmp(resp_table.intensity, 'high') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'sad_low'));
            sub_table.num_sad_low_unexpected_low_intensity = sum(strcmp(resp_table.intensity, 'low') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'sad_low'));
            sub_table.num_angry_high_expected_high_intensity = sum(strcmp(resp_table.intensity, 'high') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'angry_high'));
            sub_table.num_angry_high_expected_low_intensity = sum(strcmp(resp_table.intensity, 'low') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'angry_high'));
            sub_table.num_angry_high_unexpected_high_intensity = sum(strcmp(resp_table.intensity, 'high') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'angry_high'));
            sub_table.num_angry_high_unexpected_low_intensity = sum(strcmp(resp_table.intensity, 'low') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'angry_high'));
            sub_table.num_angry_low_expected_high_intensity = sum(strcmp(resp_table.intensity, 'high') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'angry_low'));
            sub_table.num_angry_low_expected_low_intensity = sum(strcmp(resp_table.intensity, 'low') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'angry_low'));
            sub_table.num_angry_low_unexpected_high_intensity = sum(strcmp(resp_table.intensity, 'high') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'angry_low'));
            sub_table.num_angry_low_unexpected_low_intensity = sum(strcmp(resp_table.intensity, 'low') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'angry_low'));         
            

            % REACTION TIMES
            
            %% IMPUTE RTs of .800 FOR MISSED TRIALS
         
            resp_table.response_time = str2double(resp_table.response_time);
            resp_table.response_time(isnan(resp_table.response_time)) = 0.800;

            sub_table.rt_sad_high_expected_high_intensity = nanmean(resp_table.response_time(strcmp(resp_table.intensity, 'high') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'sad_high')));
            sub_table.rt_sad_high_expected_low_intensity = nanmean(resp_table.response_time(strcmp(resp_table.intensity, 'low') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'sad_high')));
            sub_table.rt_sad_high_unexpected_high_intensity = nanmean(resp_table.response_time(strcmp(resp_table.intensity, 'high') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'sad_high')));
            sub_table.rt_sad_high_unexpected_low_intensity = nanmean(resp_table.response_time(strcmp(resp_table.intensity, 'low') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'sad_high')));
            sub_table.rt_sad_low_expected_high_intensity = nanmean(resp_table.response_time(strcmp(resp_table.intensity, 'high') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'sad_low')));
            sub_table.rt_sad_low_expected_low_intensity = nanmean(resp_table.response_time(strcmp(resp_table.intensity, 'low') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'sad_low')));
            sub_table.rt_sad_low_unexpected_high_intensity = nanmean(resp_table.response_time(strcmp(resp_table.intensity, 'high') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'sad_low')));
            sub_table.rt_sad_low_unexpected_low_intensity = nanmean(resp_table.response_time(strcmp(resp_table.intensity, 'low') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'sad_low')));
            sub_table.rt_angry_high_expected_high_intensity = nanmean(resp_table.response_time(strcmp(resp_table.intensity, 'high') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'angry_high')));
            sub_table.rt_angry_high_expected_low_intensity = nanmean(resp_table.response_time(strcmp(resp_table.intensity, 'low') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'angry_high')));
            sub_table.rt_angry_high_unexpected_high_intensity = nanmean(resp_table.response_time(strcmp(resp_table.intensity, 'high') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'angry_high')));
            sub_table.rt_angry_high_unexpected_low_intensity = nanmean(resp_table.response_time(strcmp(resp_table.intensity, 'low') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'angry_high')));
            sub_table.rt_angry_low_expected_high_intensity = nanmean(resp_table.response_time(strcmp(resp_table.intensity, 'high') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'angry_low')));
            sub_table.rt_angry_low_expected_low_intensity = nanmean(resp_table.response_time(strcmp(resp_table.intensity, 'low') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'angry_low')));
            sub_table.rt_angry_low_unexpected_high_intensity = nanmean(resp_table.response_time(strcmp(resp_table.intensity, 'high') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'angry_low')));
            sub_table.rt_angry_low_unexpected_low_intensity = nanmean(resp_table.response_time(strcmp(resp_table.intensity, 'low') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'angry_low')));     
            
            
            
            
            if experiment_mode == "inperson"
                % register missed trials and trial_type. Note this is 1-indexed
                for i=predict_table.trial_number'
                    if (~any(resp_table.trial_number == i))
                        missing_trial_type{i+1} = predict_table.trial_type{i+1};
                    else
                        missing_trial_type{i+1} = nan;
                    end
                end
            end

            if experiment_mode == "mturk" | experiment_mode=="prolific"
                missing_trial_type = resp_table.trial_type(strcmp(resp_table.result, 'too slow sad') | strcmp(resp_table.result, 'too slow angry'));
            end
            
            matching_rows = strcmp(resp_table.result, 'too slow sad') | strcmp(resp_table.result, 'too slow angry');
            sub_table.r_missed_sad_high_expected_high_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'high') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'sad_high'));
            sub_table.r_missed_sad_high_expected_low_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'low') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'sad_high'));
            sub_table.r_missed_sad_high_unexpected_high_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'high') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'sad_high'));
            sub_table.r_missed_sad_high_unexpected_low_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'low') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'sad_high'));
            sub_table.r_missed_sad_low_expected_high_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'high') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'sad_low'));
            sub_table.r_missed_sad_low_expected_low_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'low') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'sad_low'));
            sub_table.r_missed_sad_low_unexpected_high_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'high') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'sad_low'));
            sub_table.r_missed_sad_low_unexpected_low_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'low') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'sad_low'));
            sub_table.r_missed_angry_high_expected_high_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'high') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'angry_high'));
            sub_table.r_missed_angry_high_expected_low_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'low') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'angry_high'));
            sub_table.r_missed_angry_high_unexpected_high_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'high') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'angry_high'));
            sub_table.r_missed_angry_high_unexpected_low_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'low') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'angry_high'));
            sub_table.r_missed_angry_low_expected_high_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'high') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'angry_low'));
            sub_table.r_missed_angry_low_expected_low_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'low') & resp_table.expectation == 1 & strcmp(resp_table.trial_type, 'angry_low'));
            sub_table.r_missed_angry_low_unexpected_high_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'high') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'angry_low'));
            sub_table.r_missed_angry_low_unexpected_low_intensity = sum(matching_rows & strcmp(resp_table.intensity, 'low') & resp_table.expectation == 0 & strcmp(resp_table.trial_type, 'angry_low'));
            
            % get number of times chose left and right for predict v
            % responses
            sub_table.predicted_right_side = sum(strcmp(predict_table.response, 'right'));
            sub_table.predicted_left_side = sum(strcmp(predict_table.response, 'left'));
            sub_table.responded_right_side = sum(strcmp(resp_table.response, 'right'));
            sub_table.responded_left_side = sum(strcmp(resp_table.response, 'left'));
            
            
            %% get number of times chose left or right consecutively
            responses_resp = resp_table.response;
            responses_pred = predict_table.response;

            % Initialize variables for resp_table.response
            max_left_consecutive_resp = 0;
            max_right_consecutive_resp = 0;
            current_left_resp = 0;
            current_right_resp = 0;
            % Initialize variables for predict_table.response
            max_left_consecutive_pred = 0;
            max_right_consecutive_pred = 0;
            current_left_pred = 0;
            current_right_pred = 0;
            % Loop through resp_table.response
            for i = 1:length(responses_resp)
                if strcmp(responses_resp{i}, 'left')
                    current_left_resp = current_left_resp + 1;
                    max_left_consecutive_resp = max(max_left_consecutive_resp, current_left_resp);
                    current_right_resp = 0; % Reset right count
                elseif strcmp(responses_resp{i}, 'right')
                    current_right_resp = current_right_resp + 1;
                    max_right_consecutive_resp = max(max_right_consecutive_resp, current_right_resp);
                    current_left_resp = 0; % Reset left count
                end
            end

            % Loop through predict_table.response
            for i = 1:length(responses_pred)
                if strcmp(responses_pred{i}, 'left')
                    current_left_pred = current_left_pred + 1;
                    max_left_consecutive_pred = max(max_left_consecutive_pred, current_left_pred);
                    current_right_pred = 0; % Reset right count
                elseif strcmp(responses_pred{i}, 'right')
                    current_right_pred = current_right_pred + 1;
                    max_right_consecutive_pred = max(max_right_consecutive_pred, current_right_pred);
                    current_left_pred = 0; % Reset left count
                end
            end
            
            sub_table.max_left_consecutive_pred = max_left_consecutive_pred;
            sub_table.max_left_consecutive_resp = max_left_consecutive_resp;
            sub_table.max_right_consecutive_pred = max_right_consecutive_pred;
            sub_table.max_right_consecutive_resp = max_right_consecutive_resp;


            %% Find win/stay lose/shift for predicitons            
            % Initialize counters for high tone
            lose_stay_count_high = 0;
            win_shift_count_high = 0;
            lose_stay_count_low = 0;
            win_shift_count_low = 0;
            
            high_rows = contains(predict_table.trial_type, 'high');
            low_rows = contains(predict_table.trial_type, 'low');

            total_wins_high = 0;
            total_losses_high = 0;
            total_wins_low = 0;
            total_losses_low = 0;
            % Process 'high' rows
            high_indices = find(high_rows);
            for i = 2:length(high_indices) % Start from the second index
                current_result = predict_table.result{high_indices(i)};
                previous_result = predict_table.result{high_indices(i - 1)};
                
                if strcmp(previous_result, 'correct')
                    total_wins_high = total_wins_high + 1;
                else
                    total_losses_high = total_losses_high + 1;
                end

                % Check correctness of results for high rows
                if strcmp(previous_result, 'incorrect') && strcmp(current_result, 'incorrect')
                    lose_stay_count_high = lose_stay_count_high + 1;
                elseif strcmp(previous_result, 'correct') && strcmp(current_result, 'incorrect')
                    win_shift_count_high = win_shift_count_high + 1;
                end
            end

            % Process 'low' rows
            low_indices = find(low_rows);
            for i = 2:length(low_indices) % Start from the second index
                current_result = predict_table.result{low_indices(i)};
                previous_result = predict_table.result{low_indices(i - 1)};

                if strcmp(previous_result, 'correct')
                    total_wins_low = total_wins_low + 1;
                else
                    total_losses_low = total_losses_low + 1;
                end
                
                % Check correctness of results for low rows
                if strcmp(previous_result, 'incorrect') && strcmp(current_result, 'incorrect')
                    lose_stay_count_low = lose_stay_count_low + 1;
                elseif strcmp(previous_result, 'correct') && strcmp(current_result, 'incorrect')
                    win_shift_count_low = win_shift_count_low + 1;
                end
            end
            
            sub_table.lose_stay_high = lose_stay_count_high/total_losses_high;
            sub_table.win_shift_high = win_shift_count_high/total_wins_high;
            sub_table.lose_stay_low = lose_stay_count_low/total_losses_low;
            sub_table.win_shift_low = win_shift_count_low/total_wins_low;


end