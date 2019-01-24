%CamToWorld([0;0], 10/180*pi, 150, 5);
%alpha in grad
function pos  = CamToWorld(pixelcoord)
plane_height = 72;  %77 bei Iske Buch
alpha = 18.5; %18.5
h= 275 - plane_height;
f_px =[276.3065;275.7723];
image_size = [320;240];
camera_pos = [0;275;-315];

%Pixelkoordinatensystem verschieben
pixelcoord(1) = pixelcoord(1) - image_size(1)/2;
pixelcoord(2) = -pixelcoord(2) + image_size(2)/2;

%Position sch?tzen
alpha = alpha * pi / 180;
z_est = h/cos(alpha) / (tan(alpha) - pixelcoord(2)/f_px(2));
y_est = z_est * pixelcoord(2)/f_px(2);
x_est = z_est * pixelcoord(1)/f_px(1);

%rotieren
pos1 = [1 0 0; 0 cos(alpha) -sin(alpha); 0 sin(alpha) cos(alpha)] * [x_est; y_est; z_est];

%Position der Kamera einbeziehen
pos = pos1 + camera_pos;


end