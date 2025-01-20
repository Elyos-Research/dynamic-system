% Parámetros del sistema
m = 80;                % Masa del carro (kg)
rho = 1.225;           % Densidad del aire (kg/m^3)
C_d = 0.1;             % Coeficiente de arrastre aerodinámico
A = 0.44;              % Área frontal (m^2)
T_motor = 4.4;         % Torque máximo del motor (Nm)
R_rueda = 0.46;        % Radio de las ruedas (m)
C_rr = 0.0015;         % Coeficiente de rodadura
g = 9.81;              % Gravedad (m/s^2)
R_giro = 5.42;         % Radio de giro y de curva (m)

% Tipo de simulación
simular_curva = false; % Cambiar a true para simular una curva, false para línea recta

% Condiciones iniciales
x0 = 0; y0 = 0; z0 = 0;          % Posición inicial (m)
vx0 = 0; vy0 = 0; vz0 = 0;       % Velocidad inicial (m/s)
psi0 = 0; phi0 = 0; theta0 = 0;  % Orientaciones iniciales (rad)
estado_inicial = [x0, y0, z0, vx0, vy0, vz0, psi0, phi0, theta0];

% Tiempo de simulación
t_span = [0, 60];  % Tiempo en segundos

% Modelo dinámico
modelo = @(t, estado) ecuaciones_dinamicas(t, estado, m, rho, C_d, A, T_motor, R_rueda, C_rr, g, R_giro, simular_curva);

% Resolver las ecuaciones diferenciales
[t, estados] = ode45(modelo, t_span, estado_inicial);

% Extraer resultados
x = estados(:, 1); y = estados(:, 2); z = estados(:, 3);
vx = estados(:, 4); vy = estados(:, 5); vz = estados(:, 6);
psi = estados(:, 7); phi = estados(:, 8); theta = estados(:, 9);

% Graficar resultados
figure;

% Trayectoria 3D
subplot(3, 1, 1);
plot3(x, y, z);
xlabel('Posición X (m)');
ylabel('Posición Y (m)');
zlabel('Posición Z (m)');
title('Trayectoria del carro');
grid on;

% Velocidades
subplot(3, 1, 2);
plot(t, vx, 'r', 'DisplayName', 'v_x');
hold on;
plot(t, vy, 'g', 'DisplayName', 'v_y');
plot(t, vz, 'b', 'DisplayName', 'v_z');
hold off;
xlabel('Tiempo (s)');
ylabel('Velocidad (m/s)');
legend;
title('Velocidades en las tres direcciones');
grid on;

% Orientaciones
subplot(3, 1, 3);
plot(t, psi, 'r', 'DisplayName', '\psi (Yaw)');
hold on;
plot(t, phi, 'g', 'DisplayName', '\phi (Roll)');
plot(t, theta, 'b', 'DisplayName', '\theta (Pitch)');
hold off;
xlabel('Tiempo (s)');
ylabel('Ángulos (rad)');
legend;
title('Orientación del carro');
grid on;

% Función de ecuaciones dinámicas
function dEstado = ecuaciones_dinamicas(~, estado, m, rho, C_d, A, T_motor, R_rueda, C_rr, g, R_giro, simular_curva)
    % Descomponer el estado
    x = estado(1); y = estado(2); z = estado(3);
    vx = estado(4); vy = estado(5); vz = estado(6);
    psi = estado(7); phi = estado(8); theta = estado(9);

    % Fuerzas en cada dirección
    F_motor = T_motor / R_rueda;  % Fuerza motriz
    F_aero_x = 0.5 * rho * C_d * A * vx^2;
    F_aero_y = 0.5 * rho * C_d * A * vy^2;
    F_aero_z = 0.5 * rho * C_d * A * vz^2;
    F_rod_x = C_rr * m * g;

    if simular_curva
        % Simulación en curva
        F_y = m * (vx^2 / R_giro);  % Fuerza lateral centrípeta
        a_y = F_y / m;
    else
        % Simulación en línea recta
        F_y = 0;
        a_y = 0;
    end

    % Aceleraciones
    ax = (F_motor - F_aero_x - F_rod_x) / m;
    az = (-m * g + F_aero_z) / m;

    % Derivadas del estado
    dEstado = zeros(9, 1);
    dEstado(1) = vx;            % dx/dt
    dEstado(2) = vy;            % dy/dt
    dEstado(3) = vz;            % dz/dt
    dEstado(4) = ax;            % dvx/dt
    dEstado(5) = a_y;           % dvy/dt
    dEstado(6) = az;            % dvz/dt
    dEstado(7) = 0.1;           % dpsi/dt
    dEstado(8) = 0.05;          % dphi/dt
    dEstado(9) = 0.05;          % dtheta/dt
end
