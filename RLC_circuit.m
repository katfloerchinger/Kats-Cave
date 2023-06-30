% author: Kat

clc; clear all; close all;

%% PART A

% Define the values of L, C, and R
L = 1.5; % H
C = 0.1e-6; % F
R = 1000; % ohms

% Define the input signal parameters
T = 1; % Period of the square wave (s)
A = 2; % Amplitude of the square wave
mean_value = 0; % Mean value of the square wave

% Number of harmonics
numHarmonics = 301;

% Define the frequency range
f = logspace(1, 6, 100); % [101, 106] r/s
w = 2*pi*f; % Convert from Hz to rad/s

% Initialize arrays for transfer function magnitude, input spectrum magnitude, and output spectrum magnitude
transfer_function_mag = zeros(size(f));
input_spectrum_mag = zeros(size(f));
output_spectrum_mag = zeros(size(f));

% Perform calculations for each frequency
for k = 1:length(f)
    % Calculate the transfer function magnitude at the frequency
    s = 1i * w(k);
    H = 1 / (L*C*s^2 + R*C*s + 1);
    transfer_function_mag(k) = abs(H);
    
    % Calculate the line spectrum magnitude of the input signal at the frequency
    input_spectrum_mag(k) = abs((A * sin(w(k)*T/2)) / (w(k)*T/2));
    
    % Calculate the line spectrum magnitude of the output signal at the frequency
    output_spectrum_mag(k) = abs(H) * input_spectrum_mag(k);
end

%% PART B

% Plot the graph
figure;
semilogx(f, 20*log10(transfer_function_mag), 'b-', 'LineWidth', 1); % Transfer function magnitude (solid line)
hold on;
semilogx(f, 20*log10(input_spectrum_mag), 'r+', 'MarkerSize', 8); % Input line spectrum magnitude (+' symbol)
semilogx(f, 20*log10(output_spectrum_mag), 'ko', 'MarkerSize', 6); % Output line spectrum magnitude ('o' symbol)

% Set axis limits and labels
axis([10^1 10^6 -100 20]);
xlabel('Frequency (r/s)');
ylabel('Magnitude (dB)');

% Add a legend and Title
legend('Transfer Function Magnitude', 'Input Line Spectrum', 'Output Line Spectrum');
title('Frequency Domain Analysis');
grid on;

%% PART C 
% Time range
% Define the values of L, C, and R
L = 1.5; % H
C = 0.1e-6; % F
R = 1000; % ohms

% Define the input signal parameters
T = 0.2; % Period of the square wave (s)
A = 2; % Amplitude of the square wave
mean_value = 0; % Mean value of the square wave

% Time range
t = linspace(0, 3*T, 5000); % 3 periods with 5000 points

% Calculate the input square wave signal vIN(t)
vIN = A * square(2*pi/T * t, 50) + mean_value;

% Calculate the output signal vC(t)
vC = zeros(size(t));
for i = 1:length(t)
    % Calculate the voltage across the capacitor at each time point
    vC(i) = R * (1 - log(-t/R*C)) * vIN; %% CHANGE THIS Figure out Vout
end

% Plot both input and output signals on the same graph
figure(2);
sgtitle('Big Booty Bichez') %% OVERALL FIGURE NAME
subplot(1,2,1)
semilogx(f, 20*log10(transfer_function_mag), 'b-', 'LineWidth', 1); % Transfer function magnitude (solid line)
hold on;
semilogx(f, 20*log10(input_spectrum_mag), 'r+', 'MarkerSize', 8); % Input line spectrum magnitude (+' symbol)
semilogx(f, 20*log10(output_spectrum_mag), 'ko', 'MarkerSize', 6); % Output line spectrum magnitude ('o' symbol)
axis([10^1 10^6 -100 20]);
xlabel('Frequency (r/s)');
ylabel('Magnitude (dB)');
legend('Transfer Function Magnitude', 'Input Line Spectrum', 'Output Line Spectrum');
title('Frequency Domain Analysis');
grid on;
subplot(1,2,2)
plot(t*1000, vIN, 'b-', 'LineWidth', 1); % Plot input signal in blue
hold on;
plot(t*1000, vC, 'r-', 'LineWidth', 1); % Plot output signal in red
axis([0 3*T*1000 -1.5 1.5]);
xlabel('Time (ms)');
ylabel('Signal Amplitude');
title('Time Domain Analysis for T = 0.2');
legend('Input Square Wave Signal vIN(t)', 'Output Signal vC(t)');
grid on;


