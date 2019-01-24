% Transform world coord to pixel coord
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% world coord (world sits on the front of the car)
P = [0;0;400;1];

% angle and dist. from camera to front of car/ world init coord system
alpha = 18.5*pi/180;
ly = 275;
lz = 315;

% intrinsic param
INTR = [276.3065,0,165.5154;
        0,275.7723,114.2744;
        0,0,1];
    

% transformation  world to cam/ extrinsic matrix
T = [1,0,0,0;
    0,cos(alpha),sin(alpha),ly;
    0,-sin(alpha),cos(alpha),lz; 
    0,0,0,1];
P_cam = T * P;


pixel = INTR * [1,0,0,0;0,1,0,0;0,0,1,0] * P_cam   ;%* inv(T)
pixel = pixel / pixel(3);

