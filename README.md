# Modelo Dinámico de un Carro de Tres Ruedas

Este repositorio contiene un modelo dinámico de un carro de tres ruedas, desarrollado para simular su comportamiento en diferentes condiciones: en línea recta y durante curvas. A continuación, se presentan las ecuaciones utilizadas en el programa.

---

## 1. Estados del Sistema

El estado del sistema se define como:

$$
X = \begin{bmatrix} x \\ y \\ z \\ v_x \\ v_y \\ v_z \\ \psi \\ \phi \\ \theta \end{bmatrix}
$$

Donde:
- $$\(x, y, z\)$$: Posición del carro en el espacio (m).
- $$\(v_x, v_y, v_z\)$$: Componentes de la velocidad en las direcciones longitudinal, lateral y vertical (m/s).
- $$\(\psi\)$$: Ángulo de yaw, rotación alrededor del eje \(z\) (rad).
- $$\(\phi\)$$: Ángulo de roll, rotación alrededor del eje \(x\) (rad).
- $$\(\theta\)$$: Ángulo de pitch, rotación alrededor del eje \(y\) (rad).

---

## 2. Dinámica del Movimiento

### 2.1. Movimiento Longitudinal (\(x\))

$$
\frac{dx}{dt} = v_x
$$

$$
\frac{dv_x}{dt} = \frac{1}{m} \left( F_{\text{motor}} - F_{\text{aero},x} - F_{\text{rod},x} \right)
$$

Donde:

$$
F_{\text{motor}} = \frac{T_{\text{motor}}}{R_{\text{rueda}}}
$$

$$
F_{\text{aero},x} = \frac{1}{2} \rho C_d A v_x^2
$$

$$
F_{\text{rod},x} = C_{\text{rr}} m g
$$

### 2.2. Movimiento Lateral (\(y\))

$$
\frac{dy}{dt} = v_y
$$

$$
\frac{dv_y}{dt} = \frac{1}{m} F_y
$$

Donde:

$$
F_y = \frac{m v_x^2}{R_{\text{giro}}}
$$

### 2.3. Movimiento Vertical (\(z\))

$$
\frac{dz}{dt} = v_z
$$

$$
\frac{dv_z}{dt} = \frac{1}{m} \left( -m g + F_{\text{aero},z} \right)
$$

Donde:

$$
F_{\text{aero},z} = \frac{1}{2} \rho C_d A v_z^2
$$

---

## 3. Fuerzas Resistivas

### 3.1. Resistencia Aerodinámica

$$
F_{\text{aero},x} = \frac{1}{2} \rho C_d A v_x^2
$$

$$
F_{\text{aero},y} = \frac{1}{2} \rho C_d A v_y^2
$$

$$
F_{\text{aero},z} = \frac{1}{2} \rho C_d A v_z^2
$$

### 3.2. Resistencia de Rodadura

$$
F_{\text{rod},x} = C_{\text{rr}} m g
$$

---

## 4. Orientaciones

### 4.1. Yaw $$(\psi\)$$

$$
\frac{d\psi}{dt} = \omega_z
$$

### 4.2. Roll $$(\phi\)$$

$$
\frac{d\phi}{dt} = \omega_x
$$

### 4.3. Pitch $$\(\theta\)$$

$$
\frac{d\theta}{dt} = \omega_y
$$

---

## 5. Parámetros Utilizados

- $$\(m\)$$: Masa del carro (kg).
- $$\(T_{\text{motor}}\)$$: Torque máximo del motor (Nm).
- $$\(R_{\text{rueda}}\)$$: Radio de las ruedas (m).
- $$\(
ho\)$$: Densidad del aire $$(\(1.225 \, \text{kg/m}^3\))$$.
- $$\(C_d\)$$: Coeficiente de arrastre aerodinámico.
- $$\(A\)$$: Área frontal del carro $$(\(m^2\))$$.
- $$\(C_{\text{rr}}\)$$: Coeficiente de rodadura.
- $$\(g\)$$: Gravedad $$(\(9.81 \, \text{m/s}^2\))$$.
- $$\(R_{\text{giro}}\)$$: Radio de giro $$(\(5.42 \, \text{m}\))$$.

---

## 6. Simulaciones

El modelo puede simular:
1. Movimiento en línea recta: $$\(F_y = 0, v_y = 0\)$$.
2. Movimiento en curvas: $$\(R_{\text{curva}} = R_{\text{giro}})$$.

Para más información, revisa el script principal y ejecuta las simulaciones.

---

## Contribuciones

Si deseas colaborar o mejorar el modelo, siéntete libre de abrir un issue o enviar un pull request. 😊
