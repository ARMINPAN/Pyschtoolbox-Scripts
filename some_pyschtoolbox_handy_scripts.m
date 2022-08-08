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

% Screen('DrawLine',windowPtr[,color],fromH,fromV,toH,toV[.penWidth]);
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


PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
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

%% Draw multiple rects
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);


rect1_pos = [100 100 200 200];
rect2_pos = [400 400 500 500];

bothrects_pos = [rect1_pos', rect2_pos'];

color1 = [100, 200, 240]; % color
color2 = [200, 100, 240]; % color
bothcolors = [color1', color2'];
 
Screen('FillRect',windowPtr,bothcolors,bothrects_pos);
Screen('Flip',windowPtr)

WaitSecs(2)
sca;

%% Centering - finding the center of a screen
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);

X_center = rect(3)/2;
Y_center = rect(4)/2;

L1_rect = 400;
L2_rect = 400;

X1_rect = X_center - L1_rect/2;
Y1_rect = Y_center - L2_rect/2;

X2_rect = X_center + L1_rect/2;
Y2_rect = Y_center + L2_rect/2;

color = [10 30 100];
Screen('FillRect',windowPtr,color,[X1_rect Y1_rect X2_rect Y2_rect]);
Screen('Flip',windowPtr)

WaitSecs(2)
sca;

%% not filled rectangle
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);

color = [100 50 100];
rectpos = [300 300 600 600];
penWidth = 2;
Screen('FrameRect',windowPtr,color,rectpos,penWidth);
Screen('Flip',windowPtr)

WaitSecs(2)
sca;

%% draw circle
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);

color = [100 50 100];
circpos = [300 300 600 600];
Screen('FillOval',windowPtr,color,rectpos);
Screen('Flip',windowPtr)

WaitSecs(2)
sca;

%% Alpha Blending
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);



% circle on rect - both can be seen
color = [100 50 100];
rectpos = [300 300 600 600];
Screen('FillRect',windowPtr,color,rectpos);
color = [200 150 200];
circpos = [300 300 600 600];
Screen('FillOval',windowPtr,color,circpos);

% rect on circle - circ will be behind rect and can't be seen
color = [200 150 200];
circpos = [1500 700 1800 1000];
Screen('FillOval',windowPtr,color,circpos);
color = [100 50 100];
rectpos = [1500 700 1800 1000];
Screen('FillRect',windowPtr,color,rectpos);

% add alpha blending to have both
Screen('BlendFunction',windowPtr,GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA) % active blending
color = [10 250 150];
circpos = [800 500 1100 800];
Screen('FillOval',windowPtr,color,circpos);
color = [10 150 250 127]; % make the rect transpaernt
rectpos = [800 500 1100 800];
Screen('FillRect',windowPtr,color,rectpos);


Screen('Flip',windowPtr)

%% alpha blending one more example
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);

% find center of scren
X_center = rect(3)/2;
Y_center = rect(4)/2;

% rectangles width and height
L1_rect = 400;
L2_rect = 400;

% enable blending
Screen('BlendFunction',windowPtr,GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA)

% rect1
X1_rect = X_center - L1_rect/4;
Y1_rect = Y_center - L2_rect/4;
X2_rect = X_center + 3*L1_rect/4;
Y2_rect = Y_center + 3*L2_rect/4;
color = [10 30 100 200];
Screen('FillRect',windowPtr,color,[X1_rect Y1_rect X2_rect Y2_rect]);

% rect2
X1_rect = X_center - 3*L1_rect/4;
Y1_rect = Y_center - 3*L2_rect/4;
X2_rect = X_center + L1_rect/4;
Y2_rect = Y_center + L2_rect/4;
color = [10 250 50 200];
Screen('FillRect',windowPtr,color,[X1_rect Y1_rect X2_rect Y2_rect]);

% show shapes
Screen('Flip',windowPtr)

WaitSecs(2)
sca;



%% DrawLine
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);

% find center of scren
X_center = rect(3)/2;
Y_center = rect(4)/2;

L_line = 200;
penWidth = 1;
for theta = 0:0.01:8*pi
    color = 256*rand(1,3);
    x = X_center + L_line*cos(theta);
    y = Y_center + L_line*sin(theta);
    penWidth = penWidth+0.001;
    Screen('DrawLine',windowPtr,color,X_center,Y_center,x,y,penWidth);
    % update screen
    Screen('Flip',windowPtr);
end

WaitSecs(2)
sca;

%% DrawLines
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);

% find center of scren
X_center = rect(3)/2;
Y_center = rect(4)/2;

n = 12; % 2* number of lines
thetas = linspace(0,2*pi-2*pi/n,n);
xy = zeros(2,n);
color = zeros(3,n);
L = 200;

% end points of the lines
for i = 1:n
    xy(1,i) = L*sin(thetas(i));
    xy(2,i) = L*cos(thetas(i));
    color(:,i) = 256*rand(1,3);
end

width = 5;
% drawlines
Screen('DrawLines',windowPtr,xy,width,color,[X_center, Y_center],0)

% show on screen
Screen('Flip',windowPtr)


KbWait()
sca;

%% DrawDots - draw multiple shapes
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);

% find center of scren
X_center = rect(3)/2;
Y_center = rect(4)/2;

% number of shapes 
n = 3;

% colors
colors = 256*rand(3,n);

% locs 
locations = [-500 0 500;0 0 0];

% sizes 
sizes = [50 100 150];

% draw
Screen('DrawDots',windowPtr,locations,sizes,colors,[X_center, Y_center], 0);

% show on screen
Screen('Flip',windowPtr);


KbWait()
sca;

%% fixation point on center
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);

% find center of scren
X_center = rect(3)/2;
Y_center = rect(4)/2;

xy = [0 0 -40 40;...
    -40 +40 0 0];

color = [10 150 250];
width = 5;
Screen('DrawLines',windowPtr,xy,width,color,[X_center Y_center]);
Screen('Flip',windowPtr);

KbWait()
sca

%% animations can be implemented using loops - color animation
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);

% find center of scren
X_center = rect(3)/2;
Y_center = rect(4)/2;

startTime = GetSecs();

color = [0 0 0];
selected_col = 1;
adding_color = [0 0 0];
adding_color(selected_col) = 1;

% animation goes on until 30s
while GetSecs() < startTime + 30
    color = color + adding_color;
    xy = [X_center-100 Y_center-100 X_center+100 Y_center+100];
    Screen('FillRect',windowPtr,color,xy)
    Screen('Flip',windowPtr)
    if(color(selected_col) >= 256)
        color(selected_col) = 0;
        adding_color = [0 0 0];
        selected_col = randperm(3,1);
        adding_color(selected_col) = 1;
    end
end

sca;

%% Drawing text - DrawText
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);

% 1. set up all the properties of the text we want to draw(font, size, style)
text_size = 48;
Screen('TextSize',windowPtr,text_size)

text_font = 'Arial';
Screen('TextFont',windowPtr,text_font)

text_style = 1; % 0:normal - 1:bold - 2:italic - 4:underline - 8:outline - 32:condence - 64:extend
Screen('TextStyle',windowPtr,text_style)

% 2. draw the text using DrawText
text = 'Hello Subject!';
x = 800;
y = 540;
color = [0 150 250];
Screen('DrawText',windowPtr,text,x,y,color);

% show on screen
Screen('Flip',windowPtr);

% size of our text in screen
rect = Screen('TextBounds',windowPtr,text)

KbWait()
sca

%% Drawing Formatex text - DrawFormattedText
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);

% 1. set up all the properties of the text we want to draw(font, size, style)
text_size = 48;
Screen('TextSize',windowPtr,text_size)

text_font = 'Arial';
Screen('TextFont',windowPtr,text_font)

text_style = 1; % 0:normal - 1:bold - 2:italic - 4:underline - 8:outline - 32:condence - 64:extend
Screen('TextStyle',windowPtr,text_style)


% 2. draw the text using DrawFormattedText
text = 'Hello Subject!\n Get ready for the experiment...';
color = [100 150 250];
DrawFormattedText(windowPtr,text,'center','center',color);

% show on screen
Screen('Flip',windowPtr);


KbWait()
sca

%% Displaying pictures - 
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);


% 1. Use imread() to read the image into a matrix of numbers
happyface = imread('happyface.jpg');

% 2. Use MakeTexture to create an OpenGL texture using that matrix
happyface_texture = Screen('MakeTexture',windowPtr,happyface); 

% 3. Use DrawTexture to draw the texture to the screen
Screen('DrawTexture',windowPtr,happyface_texture)
Screen('Flip',windowPtr)

KbWait()
sca 


%% Moving images
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);


% 1. Use imread() to read the image into a matrix of numbers
happyface = imread('happyface.jpg');

% 2. Use MakeTexture to create an OpenGL texture using that matrix
happyface_texture = Screen('MakeTexture',windowPtr,happyface); 

% image position
[image_width, image_height, n_chan] = size(happyface);
imagepos = [0 0 image_width image_height];

% 3. Use DrawTexture to draw the texture to the screen
Screen('DrawTexture',windowPtr,happyface_texture,[],imagepos)
Screen('Flip',windowPtr)

KbWait()
%%%%%%%%%%%%%%% move image
% image position
x_offset = 700; y_offset = 500;
imagepos = [x_offset y_offset x_offset+image_width y_offset+image_height];

% 3. Use DrawTexture to draw the texture to the screen
Screen('DrawTexture',windowPtr,happyface_texture,[],imagepos)
Screen('Flip',windowPtr)

KbWait()
sca

%% CenterRect - centerize an item(itemPos, screenRect)

%% Scaling Images
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);


% 1. Use imread() to read the image into a matrix of numbers
happyface = imread('happyface.jpg');

% 2. Use MakeTexture to create an OpenGL texture using that matrix
happyface_texture = Screen('MakeTexture',windowPtr,happyface); 

% image position
[image_width, image_height, n_chan] = size(happyface);
imagepos = [0 0 image_width image_height];

destination = CenterRect(imagepos,rect);

% 3. Use DrawTexture to draw the texture to the screen
Screen('DrawTexture',windowPtr,happyface_texture,[],destination)
Screen('Flip',windowPtr)

KbWait()
% rescale image to its half
imagepos = imagepos./2;
destination = CenterRect(imagepos,rect);
% 3. Use DrawTexture to draw the texture to the screen
Screen('DrawTexture',windowPtr,happyface_texture,[],destination)
Screen('Flip',windowPtr)

WaitSecs(1) 
KbWait()
sca

%% Rotating Images
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);


% 1. Use imread() to read the image into a matrix of numbers
happyface = imread('happyface.jpg');

% 2. Use MakeTexture to create an OpenGL texture using that matrix
happyface_texture = Screen('MakeTexture',windowPtr,happyface); 

% image position
[image_width, image_height, n_chan] = size(happyface);
imagepos = [0 0 image_width image_height];

destination = CenterRect(imagepos,rect);

% 3. Use DrawTexture to draw the texture to the screen
Screen('DrawTexture',windowPtr,happyface_texture,[],destination)
Screen('Flip',windowPtr)

KbWait()
% rotate image
angle = 0;
now = GetSecs();
duration = 30; % in secs

while GetSecs <= now + duration
    Screen('DrawTexture',windowPtr,happyface_texture,[],destination,angle)
    Screen('Flip',windowPtr)
    angle = angle+1;
end

KbWait()
sca; 

%% multiple images
clc;

PsychDebugWindowConfiguration % add transparncy while in PTB

Screen('Preference', 'SkipSyncTests', 1) 
ScreenNumber = 0; 
[windowPtr, rect] = Screen('OpenWindow',ScreenNumber,255);

% find center of scren
X_center = rect(3)/2;
Y_center = rect(4)/2;


% 1. Use imread() to read the image into a matrix of numbers
happyface = imread('happyface.jpg');
angryface = imread('angryface.jpg');

% 2. Use MakeTexture to create an OpenGL texture using that matrix
happyface_texture = Screen('MakeTexture',windowPtr,happyface); 
angryface_texture = Screen('MakeTexture',windowPtr,angryface); 

% image position
[image_width, image_height, n_chan] = size(happyface);
destination_1 = [X_center Y_center X_center+image_width Y_center+image_height];

[image_width, image_height, n_chan] = size(angryface);
destination_2 = [X_center-image_width Y_center-image_height X_center Y_center];


% 3. Use DrawTexture to draw the texture to the screen
Screen('DrawTexture',windowPtr,happyface_texture,[],destination_1)
Screen('DrawTexture',windowPtr,angryface_texture,[],destination_2 )
Screen('Flip',windowPtr)

KbWait()
sca

%% transparency for images

% Screen('DrawTexture', windowPointer, texturePointer [,sourceRect] 
% [,destinationRect] [,rotationAngle] [, filterMode] [, globalAlpha] 
% [, modulateColor] [, textureShader] [, specialFlags] [, auxParameters])

% [, globalAlpha] by setting

%% displaying images
% ■ Loading images in and making textures can take time
% ■ Don't wait until you want to present the images to load them in
% ■ Make your textures at the beginning of your script, then present them on time

%% 