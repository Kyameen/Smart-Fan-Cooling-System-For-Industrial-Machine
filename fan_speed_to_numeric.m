
% Helper to convert fan speed to numeric
function nums = fan_speed_to_numeric(speeds)
    nums = zeros(size(speeds));
    for i = 1:length(speeds)
        switch speeds(i)
            case "Off"
                nums(i) = 0;
            case "Low"
                nums(i) = 1;
            case "Medium"
                nums(i) = 2;
            case "High"
                nums(i) = 3;
        end
    end
end
