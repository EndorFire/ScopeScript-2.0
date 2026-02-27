classdef recipe
    properties
        setChannel
        functions
        timePoints
        exposure
    end
    methods
        function obj = recipe(setChannel, functions, timePoints, exposure)
            if nargin > 0
                obj.setChannel = setChannel;
                obj.functions = functions;
                obj.timePoints = timePoints;
                obj.exposure = exposure;
            else 
                obj.setChannel = {};
                obj.functions = {};
                obj.timePoints = [];
                obj.exposure = [];
            end
        end
    end

end
