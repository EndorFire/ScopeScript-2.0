function [] = stageAppend(varargin)
%STAGEAPPEND allows to save multiple XY locations of the microscope stage alonside corresponding PFS offsets to the stageCoordinates list
%the stageCoordinates list is then used to execute fcScopes (Z stacks) at the selected locations as a timeLapse
%default time interval between fcScopes at different locations is 5 sec
%it can also be provided as an argument of stageAppend()

if ~isempty(varargin)
    timeOffset = varargin{1};
else
    timeOffset = 5;%sec
end

global stageCoordinates;
fcScopeCurrent = scopeParams('saveStage');


numel(stageCoordinates)
for i = 1:numel(fcScopeCurrent.recipeList)
    fcScopeCurrent.recipeList{i}.timePoints = fcScopeCurrent.recipeList{i}.timePoints + numel(stageCoordinates)*timeOffset;
end


stageCoordinates{end+1} = fcScopeCurrent;


end

