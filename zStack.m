classdef zStack
    properties
        N
        dz
        z0
    end
    methods
        function obj = zStack(N, dz, z0)
            if nargin > 0
                obj.N = N;
                obj.dz = dz;
                obj.z0 = z0;
            else
            end
        end
    end    
end        