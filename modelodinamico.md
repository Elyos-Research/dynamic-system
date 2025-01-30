# Modelo Dinámico de un Carro Eléctrico de Tres Ruedas

Este repositorio contiene un modelo dinámico de un carro eléctrico de tres ruedas, desarrollado para simular su comportamiento en diferentes condiciones. Se consideran efectos como la tracción del motor eléctrico, la resistencia aerodinámica, la resistencia a la rodadura y los cambios en altura (\(z\)) y orientación en 3D.

---

## 1. Estados del Sistema

El estado del sistema se define como:

$$
\mathbf{z} = \begin{bmatrix} x \\ y \\ z \\ \psi \\ \phi \\ \theta \\ v_x \\ v_y \\ v_z \\ \omega_z \\ \omega_x \\ \omega_y \end{bmatrix}
$$

Donde:
- $$\(x, y, z\)$$: Posición en el espacio (m).
- $$\(\psi\)$$: Ángulo de orientación (yaw) del carro respecto al marco inercial (rad).
- $$\(\phi\)$$: Ángulo de roll (rotación sobre eje longitudinal) (rad).
- $$\(\theta\)$$: Ángulo de pitch (rotación sobre eje lateral) (rad).
- $$\(v_x, v_y, v_z\)$$: Velocidades lineales en los ejes longitudinal, lateral y vertical (m/s).
- $$\(\omega_z, \omega_x, \omega_y\)$$: Velocidades angulares en yaw, roll y pitch (rad/s).

---

## 2. Dinámica del Movimiento

### 2.1. Movimiento en el Plano (\(x, y\))

$$
\frac{dx}{dt} = v_x
$$

$$
\frac{dy}{dt} = v_y
$$

### 2.2. Movimiento Vertical (\(z\))

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

### 2.3. Velocidades Lineales y Fuerzas Resistivas

$$
\frac{dv_x}{dt} = \frac{1}{m} \left( F_{\text{tracción}} - F_{\text{aero}} - F_{\text{rod}} \right)
$$

$$
F_{\text{tracción}} = \frac{T_m}{R_{\text{rueda}}}
$$

$$
F_{\text{aero}} = \frac{1}{2} \rho C_d A v_x^2
$$

$$
F_{\text{rod}} = C_{\text{rr}} m g
$$

### 2.4. Orientaciones y Rotaciones

**Yaw (\(\psi\))**:

$$
\frac{d\psi}{dt} = \omega_z
$$

$$
\frac{d\omega_z}{dt} = \frac{1}{I_z} \left( F_y L_{\text{dist}} \right)
$$

**Roll (\(\phi\))**:

$$
\frac{d\phi}{dt} = \omega_x
$$

$$
\frac{d\omega_x}{dt} = \frac{1}{I_x} \left( F_x L_{\text{dist}} \right)
$$

**Pitch (\(\theta\))**:

$$
\frac{d\theta}{dt} = \omega_y
$$

$$
\frac{d\omega_y}{dt} = \frac{1}{I_y} \left( F_z L_{\text{dist}} \right)
$$

---

## 3. Parámetros Utilizados

- $$\(m = 80\)$$ kg: Masa total del carro.
- $$\(I_z = 50\)$$ kg·m²: Momento de inercia en yaw.
- $$\(I_x = 40\)$$ kg·m²: Momento de inercia en roll.
- $$\(I_y = 45\)$$ kg·m²: Momento de inercia en pitch.
- $$\(R_{\text{rueda}} = 0.46\)$$ m: Radio de la rueda.
- $$\(C_d = 0.1\)$$: Coeficiente de arrastre aerodinámico.
- $$\(C_{\text{rr}} = 0.0015\)$$: Coeficiente de rodadura.
- $$\(g = 9.81\)$$ m/s²: Aceleración gravitacional.
- $$\(A = 0.44\)$$ m²: Área frontal del carro.
- $$\(\rho = 1.225\)$$ kg/m³: Densidad del aire.
- $$\(T_m = 4.4\)$$ Nm: Torque del motor eléctrico.
- $$\(L_{\text{dist}} = 1.2\)$$ m: Distancia entre ejes.

---

## 4. Simulaciones

Este modelo permite simular:
1. Movimiento en línea recta: $$\( \omega_z = 0, v_y = 0, v_z = 0 \)$$.
2. Movimiento en curvas: $$\( R_{\text{curva}} \neq \infty \)$$.
3. Comportamiento en terrenos irregulares con variaciones en $$\(z\)$$.


