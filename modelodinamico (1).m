% Modelo dinámico de un carro eléctrico de tres ruedas con cambios en z

% Parámetros del sistema
m = 80;           % Masa total del carro (kg)
I_z = 50;          % Momento de inercia en yaw (kg·m^2)
I_x = 40;          % Momento de inercia en roll (kg·m^2)
I_y = 45;          % Momento de inercia en pitch (kg·m^2)
R_rueda = 0.46;     % Radio de las ruedas (m)
C_d = 0.1;         % Coeficiente de arrastre aerodinámico
C_rr = 0.0015;       % Coeficiente de rodadura
g = 9.81;          % Gravedad (m/s^2)
A = 0.44;           % Área frontal del carro (m^2)
rho = 1.225;       % Densidad del aire (kg/m^3)
T_motor = 4.4;      % Torque del motor (Nm)
L_dist = 1.2;      % Distancia entre ejes (m)

% Condiciones iniciales
x_0 = 0;           % Posición inicial en x (m)
y_0 = 0;           % Posición inicial en y (m)
z_0 = 0.2;         % Posición inicial en z (m)
psi_0 = 0;         % Ángulo de orientación inicial (rad)
phi_0 = 0;         % Ángulo de roll inicial (rad)
theta_0 = 0;       % Ángulo de pitch inicial (rad)
vx_0 = 2;          % Velocidad inicial en x (m/s)
vy_0 = 0;          % Velocidad inicial en y (m/s)
vz_0 = 0;          % Velocidad inicial en z (m/s)
omega_x_0 = 0;     % Velocidad angular en roll (rad/s)
omega_y_0 = 0;     % Velocidad angular en pitch (rad/s)
omega_z_0 = 0;     % Velocidad angular en yaw (rad/s)

% Tiempo de simulación
t_span = [0 10];   % 10 segundos de simulación

% Función para el sistema dinámico
dynamics = @(t, z) [
    z(7);                                                             % dx/dt
    z(8);                                                             % dy/dt
    z(9);                                                             % dz/dt
    z(10);                                                            % dpsi/dt
    z(11);                                                            % dphi/dt
    z(12);                                                            % dtheta/dt
    (T_motor / R_rueda - 0.5 * rho * C_d * A * z(7)^2 - C_rr * m * g) / m; % dvx/dt
    z(7) * z(12);                                                     % dvy/dt
    -g + (0.5 * rho * C_d * A * z(9)^2) / m;                          % dvz/dt
    (L_dist * 0.1 * z(7)) / I_z;                                      % domega_z/dt (yaw)
    (L_dist * 0.05 * z(8)) / I_x;                                     % domega_x/dt (roll)
    (L_dist * 0.05 * z(9)) / I_y;                                     % domega_y/dt (pitch)
];

% Vector de estado inicial
z0 = [x_0; y_0; z_0; psi_0; phi_0; theta_0; vx_0; vy_0; vz_0; omega_z_0; omega_x_0; omega_y_0];

% Resolución del sistema
fprintf('Resolviendo el sistema dinámico del carro eléctrico...\n');
[t, Z] = ode45(dynamics, t_span, z0);

% Imprimir resultados parciales
fprintf('Resultados parciales:\n');
for i = 1:5:length(t)
    fprintf('t = %.2f s, x = %.2f m, y = %.2f m, z = %.2f m, psi = %.2f rad, vx = %.2f m/s\n', ...
        t(i), Z(i, 1), Z(i, 2), Z(i, 3), Z(i, 4), Z(i, 7));
end

% Resultados
title_font = 14; label_font = 12;

figure;
subplot(3, 1, 1);
plot3(Z(:, 1), Z(:, 2), Z(:, 3), 'LineWidth', 2);
grid on;
title('Trayectoria del carro', 'FontSize', title_font);
xlabel('Posición X (m)', 'FontSize', label_font);
ylabel('Posición Y (m)', 'FontSize', label_font);
zlabel('Posición Z (m)', 'FontSize', label_font);

subplot(3, 1, 2);
plot(t, Z(:, 7), 'r', 'LineWidth', 2);
grid on;
title('Velocidad Longitudinal v_x(t)', 'FontSize', title_font);
xlabel('Tiempo (s)', 'FontSize', label_font);
ylabel('v_x (m/s)', 'FontSize', label_font);

subplot(3, 1, 3);
plot(t, Z(:, 4), 'b', 'LineWidth', 2);
grid on;
title('Ángulo de orientación \psi(t)', 'FontSize', title_font);
xlabel('Tiempo (s)', 'FontSize', label_font);
ylabel('\psi (rad)', 'FontSize', label_font);
