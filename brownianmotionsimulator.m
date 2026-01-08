% 2D Brownian Motion Simulation with Reflecting Boundaries

%values
N = 100; % number of particles
T = 500; % number of steps
s = 5; % step size
x = zeros(1,N); % x parameter
y = zeros(1,N); % y parameter

xarchive = zeros(N,T);
yarchive = zeros(N,T);

x0 = x;
y0 = y;

%for-loop function creating changes in the x,y positions
for i = 1:T
    %randomize changes
    xchange = s * randn(1,N); 
    ychange = s * randn(1,N);
    
    %add changes
    x = x + xchange;
    y = y + ychange;
    
    %ensure changes stay in plot (bounce effect)
    L = 99;
    overR = x > L;
    overL = x < -L;
    overT = y > L;
    underB = y < -L;

    x(overR) = 2*L - x(overR);
    x(overL) = -2*L - x(overL);

    y(overT) = 2*L - y(overT);
    y(underB) = -2*L - y(underB);

    %archive changes
    xarchive(:,i) = x;
    yarchive(:,i) = y;

end

%calculate mean for xarchive squared + yarchive squared (msd equation)
msd = zeros(1,T);

for k = 1:T
    msd(k) = mean(xarchive(:,k).^2 + yarchive(:,k).^2); 
end



%graphs
figure;

%creating the animation graph
subplot(1,2,1);
graph1 = scatter(xarchive(:,1),yarchive(:,1));
axis equal;
xlim([-100,100]);
ylim([-100,100]);

xlabel('x');
ylabel('y');

%creating the msd graph
subplot(1,2,2);
msdLine = plot(nan, nan, 'LineWidth', 1.5);
xlim([1,T]);
ylim([0 max(msd)])
xlabel('Time Step');
ylabel('Mean Squared Displacement (MSD)');
title('MSD vs Time');
grid on;

%graph "animation"

dt = 0.01;

for j = 1:T
    subplot(1,2,1);

    set(graph1, 'XData', xarchive(:,j), 'YData', yarchive(:,j));
    title(['Time step: ', num2str(j*dt*1000), 'ms']);

    drawnow limitrate;
    pause(dt);

    subplot(1,2,2)
    set(msdLine, 'XData', 1:j, 'YData', msd(1:j))
end
