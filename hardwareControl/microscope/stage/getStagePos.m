function stagePos = getStagePos()
%GETSTAGEPOS Summary of this function goes here
%   Detailed explanation goes here

global ti2;
stagePos.X = get(ti2,'iXPOSITION');
stagePos.Y = get(ti2,'iYPOSITION');
stagePos.Z = get(ti2, 'iZPOSITION');
end

