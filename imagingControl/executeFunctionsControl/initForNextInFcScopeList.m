function [] = initForNextInFcScopeList(fcScopeList)
%INITFORNEXTINFCSCOPELIST will move the stage and setup channel for the
%next timepoint to come
% fcScopeList consists of just one fcScope, then the stagePos does not move
% to the saved one inside the parameter list

currentElapsedTimeInSeconds = returnSecsFromRunningTimer();
if isempty(currentElapsedTimeInSeconds)
    currentElapsedTimeInSeconds = 0;
end
numFcScope = numel(fcScopeList);
nextTimePoint = inf;
nextScope = [];

for i = 1:numFcScope
    if nextTimePoint > min(fcScopeList{i}.combinedTimePoints(fcScopeList{i}.combinedTimePoints > currentElapsedTimeInSeconds))
        nextTimePoint = min(fcScopeList{i}.combinedTimePoints(fcScopeList{i}.combinedTimePoints > currentElapsedTimeInSeconds));
        nextScope = fcScopeList{i};
    end
end

if nextTimePoint == inf
   return; 
end
% find the first nextTimePoint and set up its channel and stage pos

if numel(fcScopeList) > 1
    if ~isempty(nextScope.stagePos)
        fprintf('\n\n');
        fprintf('>>>>> moving to next stagepos:%i\n',i);
        gotoStagePos(nextScope.stagePos);
    end
end
% go to perfect focus
waitForSystem();
% setup channel
fprintf('>>>>> setting next channel: %s\n',nextScope.channelName);
fprintf('\n\n');
updateChannelGivenCommand(nextScope.channelName);
currentPFSState = getPFSState();
if currentPFSState
    waitForPFS(nextScope.pfsOffset);
end
return;

