%% What is this?

%%
clear;
clc;
close all;
rng('shuffle');
sca % clear screen

%% Screen command - open window
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber);
width = rect(3) % width of screen
height = rect(4) % height of screen 
frameDuration = Screen('GetFlipInterval', windowPtr) % frame Duration

%% Testing the Screen 
clc;

Screen('Preference', 'SkipSyncTests', 1)
% ScreenTest();
% VBLSyncTest(); 
% PerceptualVBLSyncTest();

% help SyncTrouble 

%% Flip
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber);
flipTime = Screen('Flip',windowPtr)


%% GetSecs - higher resolution than tic toc matlab function
clc;

now = GetSecs()
aLittleLater = GetSecs()
gap = aLittleLater - now


%% Flip elements
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber);


backBufferClearStatus = 0; % 0 will clear, 1 won't
flipTime = Screen('Flip',windowPtr,0,backBufferClearStatus)

%% Waiting

% first function
s = 5; % in secs
WaitSecs(s)

% second function
% time from the beginning of the day
% WaitSecs('UntilTime'.when)

% third function
% wait until pressing a key
% KbWait() 

%% KbWait

% [secs, keyCode, deltaSecs] = KbWait()
% secs(not useful) - gives us the time relative to the beginning of the day
% keyCode - the pressed key
% deltaSecs(not useful) - estimated time for pressing the button
% --- check every 5ms and for that its not useful

% keyCode
% vector of all the keys, with just one 1 which is for the
% pressed key and all the others are 0
% using find function we can find the pressed key index and
% using the char = KbName(index) we can have the charachter
% index = KbName(char)

[~, keyCode, ~] = KbWait()
key_index = find(keyCode)
key_char = KbName(key_index)
key_index = KbName(key_char)

%% Working with color
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber);

% using CLUT(Color Lookup Table) we can find the colors voltages
BlackIndex(windowPtr) % should be 0
WhiteIndex(windowPtr) % should be 255


% we can specify our own CLUT

%%%% rgb colors - myColor = [x, y, z]
red = [255, 0, 0];

%%%% gray scale colors - using a single number
black = 0; % equavalent to [0, 0, 0]
white = 255;
gray = 150;

%% Drawing Functions
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

ScreenNumber = 0; 
Screen('Preference', 'SkipSyncTests', 1) 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber);

% Screen('DrawLine',windowPtr[,color],fromH,toH,toV[.penWidth]);
% Screen('DrawArc',windowPtr,[color],[rect],startAngle,arcAngle);
% Screen('FrameArc',windowPtr,[color],[rect],startAngle,arcAngle[,penWidth][,penHeight][,penMode]);
% Screen('FillArc',windowPtr,[color],[rect],startAngle,arcAngle);
% Screen('FillRect',windowPtr[,color][,rect]);
% Screen('FrameRect',windowPtr[,color][,rect][,penWidth]);
% Screen('FillOval',windowPtr[,color][,rect][,prefectUpToMaxDiameter]);
% Screen('FrameOval',windowPtr[,color][,rect][,penWidth][,penHeight][,penMode]);
% Screen('FramePoly',windowPtr[,color],pointList[,penWidth]);
% Screen('DrawDots',windowPtr, xy[,size][,color][,center][,dot_type]);
% Screen('DrawLines',windowPtr, xy[,width][,colors][,center][,smooth]);

% values in brackets are arbitrary

%% OpenWindow more specified
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
bgColor = [110 20 30];
rect = [0 0 1920 1080];
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,bgColor,rect);

%% using Help of pyschtoolbox
clc;

% for modalities - Screen(as function) FillRect(as modality)?
Screen FillRect?

% for functions - help Screen(as function)
help Screen

%% some simple shapes
clc;


Screen('Preference', 'SkipSyncTests', 1) 
PsychDebugWindowConfiguration % add transparncy while in PTB

ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);

% rectangle
color = [100, 200, 240]; % color
rectpos = [800, 300, 1000, 500]; % position of rect
Screen('FillRect', windowPtr, color, rectpos);
Screen('Flip',windowPtr)
s = 2; % in secs
WaitSecs(s)

% remove rec for 2secs and the bring it back on
Screen('Flip',windowPtr)
s = 1; % in secs
WaitSecs(s)

% back on
% rectangle
color = [200, 100, 240]; % color
rectpos = [1500, 300, 1700, 500]; % position of rect
Screen('FillRect', windowPtr, color, rectpos);

% circle
color = [20, 150, 24]; % color
circpos = [1000, 500, 1200, 700]; % position of circ
Screen('FillOval',windowPtr, color, circpos);

Screen('Flip',windowPtr)
s = 2; % in secs
WaitSecs(s)

sca;

%% 