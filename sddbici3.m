% Modelo dinámico de una bicicleta con ángulos de orientación e inclinación dinámicos

% Parámetros del sistema
m = 80;           % Masa total (kg)
h = 1.2;          % Altura del centro de masa (m)
L = 1.1;          % Longitud entre ejes (m)
I = 8;            % Momento de inercia (kg·m^2)
g = 9.81;         % Gravedad (m/s^2)
v = 5;            % Velocidad inicial (m/s)
omega_phi = 0.01; % Tasa de cambio del ángulo de orientación (rad/s)

% Condiciones iniciales
theta_0 = 0.1;    % Ángulo inicial de inclinación (rad)
phi_0 = 0.05;     % Ángulo inicial de orientación (rad)
x_0 = 0;          % Posición inicial en x (m)
y_0 = 0;          % Posición inicial en y (m)

% Tiempo de simulación
t_span = [0 10];  % 10 segundos de simulación

% Función para el sistema dinámico
dynamics = @(t, z) [
    v * cos(z(4));                    % dx/dt
    v * sin(z(4));                    % dy/dt
    z(5);                             % dtheta/dt (tasa de cambio de inclinación)
    omega_phi;                        % dphi/dt (tasa de cambio del ángulo de orientación)
    (-m * g * h * sin(z(3))) / I      % d^2theta/dt^2 (dinámica de inclinación)
];

% Vector de estado inicial
z0 = [x_0; y_0; theta_0; phi_0; 0];   % [x, y, theta, phi, dtheta/dt]

% Resolución del sistema
fprintf('Resolviendo el sistema dinámico de la bicicleta...\n');
[t, Z] = ode45(dynamics, t_span, z0);

% Imprimir resultados parciales
fprintf('Resultados parciales:\n');
for i = 1:5:length(t)
    fprintf('t = %.2f s, x = %.2f m, y = %.2f m, theta = %.2f rad, phi = %.2f rad\n', ...
        t(i), Z(i, 1), Z(i, 2), Z(i, 3), Z(i, 4));
end

% Resultados
title_font = 14; label_font = 12;

figure;
subplot(3, 1, 1);
plot(Z(:, 1), Z(:, 2), 'LineWidth', 2);
grid on;
title('Trayectoria de la bicicleta', 'FontSize', title_font);
xlabel('Posición X (m)', 'FontSize', label_font);
ylabel('Posición Y (m)', 'FontSize', label_font);

subplot(3, 1, 2);
plot(t, Z(:, 3), 'r', 'LineWidth', 2);
grid on;
title('Ángulo de inclinación \theta(t)', 'FontSize', title_font);
xlabel('Tiempo (s)', 'FontSize', label_font);
ylabel('\theta (rad)', 'FontSize', label_font);

subplot(3, 1, 3);
plot(t, Z(:, 4), 'b', 'LineWidth', 2);
grid on;
title('Ángulo de orientación \phi(t)', 'FontSize', title_font);
xlabel('Tiempo (s)', 'FontSize', label_font);
ylabel('\phi (rad)', 'FontSize', label_font);
