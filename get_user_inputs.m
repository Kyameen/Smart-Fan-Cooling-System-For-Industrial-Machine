function params = get_user_inputs()
    clc;
    fprintf('--- Smart Fan Cooling System Setup ---\n');

    Ta = input('Enter ambient temperature (°C): ');
    if ~isnumeric(Ta) || Ta < -50 || Ta > 80
        error('Ambient temperature should be between -50°C and 80°C.');
    end

    L = input('Enter machine load (0–100%): ');
    if ~isnumeric(L) || L < 0 || L > 100
        error('Load must be between 0 and 100 percent.');
    end

    Tmax = input('Enter maximum temperature before shutdown (°C): ');
    if ~isnumeric(Tmax) || Tmax <= 0 || Tmax > 150
        error('Tmax must be a positive value below 150°C.');
    end

    T0 = input('Enter initial temperature (°C): ');
    if ~isnumeric(T0) || T0 < -50 || T0 > Tmax
        error('Initial temperature must be between -50°C and Tmax.');
    end

    sim_time = input('Enter simulation duration (seconds): ');
    if ~isnumeric(sim_time) || sim_time <= 0
        error('Simulation time must be a positive number.');
    end

    % Store all in struct
    params = struct('Ta', Ta, 'Tmax', Tmax, 'T0', T0, 'L', L, 'sim_time', sim_time);
end
