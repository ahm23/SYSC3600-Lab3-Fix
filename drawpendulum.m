function drawpendulum(out)
x = get(out, 'x');
theta = get(out, 'theta');
time = get(out, 'time');

if nargin==2
    % If x was not passed, just set x to a vector of zeros
    x.Data = zeros(1,length(theta.Data));
end
% Calculate the time different between subsequent time samples
timediff=diff(time.Data);
% Limit the refresh to about 10 per second
skip=ceil(0.1*length(time.Data)/(time.Data(end)-time.Data(1)));
figure(1); clf; hold on;
axis([-3 3 -1.5 1.5]);
%axis([min(x.Data)-2, max(x.Data)+2, -1.1, 1.1]);
for i=1:skip:length(theta.Data)-1
    h1=plot(x.Data(i)+sind(theta.Data(i)), cosd(theta.Data(i)), 'o');
    h2=line(x.Data(i)+[0 sind(theta.Data(i))], [0 cosd(theta.Data(i))]);
    pause(timediff(i)*5);
    drawnow;
    delete(h1); delete(h2);
end