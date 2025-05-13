function state = simulate_smart_fan(state, params)
    % SMART FAN SIMULATION
    % --------------------
    % This function simulates the temperature of a machine and adjusts fan
    % speed based on thresholds. It exports results, plots data, and performs
    % symbolic temperature analysis.

    % Fan thresholds
    lowThresh = 40;
    medThresh = 60;
    highThresh = 80;

    for i = 1:length(state.time)-1
        T_now = state.T(i);

        % Fan speed decision
        if T_now < lowThresh
            fanLevel = 0.2;
            state.FanSpeed(i) = "Low";
        elseif T_now < medThresh
            fanLevel = 0.5;
            state.FanSpeed(i) = "Medium";
        else
            fanLevel = 1.0;
            state.FanSpeed(i) = "High";
        end

        % Temperature update
       heat = state.alpha * params.L;
      cooling = state.beta * fanLevel;
      ambient = state.gamma * (T_now - params.Ta);
        T_next = T_now + heat - cooling - ambient;
        % a function for debugging
    %fprintf('t=%.1fs | T=%.2f | Heat=%.2f | Cooling=%.2f | Ambient=%.2f | Fan=%s | T_next=%.2f\n', ...
    %state.time(i), T_now, heat, cooling, ambient, state.FanSpeed(i), T_next);

        % Shutdown check
        if T_next >= params.Tmax
            state.Status(i+1:end) = "Shutdown";
            state.FanSpeed(i+1:end) = "Off";
            state.T(i+1:end) = T_next;
            fprintf('System shutdown at %.1f sec due to high temp (%.2f °C)\n', state.time(i+1), T_next);
            break;
        end

        % Store new values
        state.T(i+1) = T_next;
        state.Status(i) = "Running";
    end

    % Fill empty Status values
    if all(state.Status == "")
        state.Status(:) = "Running";
    end

    % ========== Output, Analysis, and Compliance ========== %

    % Use max()
    maxTemp = max(state.T);
    fprintf('Max temperature reached: %.2f °C\n', maxTemp);

    % Use strcmp()
    mediumCount = sum(strcmp(state.FanSpeed, "Medium"));
    fprintf('Fan ran in MEDIUM mode for %d seconds.\n', mediumCount);
% export excel 
   T_data = [state.time' state.T' fan_speed_to_numeric(state.FanSpeed)'];
headers = {'Time (s)', 'Temperature (°C)', 'Fan Speed Level'};
final_data = [headers; num2cell(T_data)];
xlswrite('temperature_log.xlsx', final_data, 'Sheet1');
xlswrite('temperature_log.xlsx', [{'System Status'}; cellstr(state.Status(:))], 'StatusSheet');

   
end

