% Number of nodes
num_nodes = 10;
% Number of time slots to run for
num_time_slots = 500;
num_calculations = 50;

% Probability of transmitting p
p = 0.025;

% Number of times to run simulation
num_intervals = 28;

efficiency = zeros(num_calculations, (num_intervals - 1));
mean_wait_time = zeros(num_calculations, (num_intervals - 1)); 
std_dev_wait_time = zeros(num_calculations, (num_intervals - 1));

for i = 1:num_intervals
    fprintf('Running simulation for p = %f.\n', p);
    [efficiency(1:num_calculations,i), mean_wait_time(1:num_calculations,i), std_dev_wait_time(1:num_calculations,i)] = pureALOHA(p, num_nodes, num_time_slots, num_calculations);
    p = p + 0.025;
end


% Adjust the probabilities vector to match the length of the results vector
probabilities = linspace(0.025, 0.025 * (size(efficiency, 2)), size(efficiency, 2));

% Efficiency plot
figure;
plot(probabilities, efficiency(end, :), 'o-');
xlabel('Transmission Probability (p)');
ylabel('Efficiency');
title('Pure ALOHA Protocol Efficiency');
grid on;

% Average wait time plot
%figure;
%plot(probabilities, mean_wait_time(end, :), 's-');
%xlabel('Transmission Probability (p)');
%ylabel('Average Wait Time');
%title('Average Wait Time in Pure ALOHA');
%grid on;

% Standard deviation of wait time plot
%figure;
%plot(probabilities, std_dev_wait_time(end, :), '*-');
%xlabel('Transmission Probability (p)');
%ylabel('Standard Deviation of Wait Time');
%title('Standard Deviation of Wait Time in Pure ALOHA');
%grid on;
