# Modelo Dinámico de una Bicicleta

Este repositorio contiene un modelo dinámico de una bicicleta, desarrollado para simular su comportamiento considerando tanto el ángulo de inclinación (\(\theta\)) como el ángulo de orientación (\(\phi\)). A continuación, se presentan las ecuaciones utilizadas.

---

## 1. Estados del Sistema

El estado del sistema se define como:

$$
\mathbf{z} = \begin{bmatrix} x \\ y \\ \theta \\ \phi \\ \dot{\theta} \end{bmatrix}
$$

Donde:
- $$\(x, y\)$$: Posición en el plano inercial (m).
- $$\(\theta\)$$: Ángulo de inclinación de la bicicleta respecto a la vertical (rad).
- $$\(\phi\)$$: Ángulo de orientación del manubrio respecto al marco inercial (rad).
- $$\(\dot{\theta}\)$$: Velocidad angular de inclinación (rad/s).

---

## 2. Dinámica del Movimiento

### 2.1. Movimiento en el Plano (\(x, y\))

$$
\frac{dx}{dt} = v \cos(\phi)
$$

$$
\frac{dy}{dt} = v \sin(\phi)
$$

Donde \(v\) es la velocidad lineal de la bicicleta.

### 2.2. Ángulo de Inclinación (\(\theta\))

La evolución del ángulo de inclinación está gobernada por:

$$
\frac{d\theta}{dt} = \dot{\theta}
$$

$$
\frac{d^2\theta}{dt^2} = \frac{-m \cdot g \cdot h \cdot \sin(\theta)}{I}
$$

Donde:
- $$\(m\)$$: Masa total de la bicicleta y el ciclista (kg).
- $$\(g\)$$: Aceleración gravitacional (\(9.81 \, \text{m/s}^2\)).
- $$\(h\)$$: Altura del centro de masa (m).
- $$\(I\)$$: Momento de inercia (kg·m²).

### 2.3. Ángulo de Orientación (\(\phi\))

La evolución del ángulo de orientación está definida como:

$$
\frac{d\phi}{dt} = \omega_{\phi}
$$

Donde \(\omega_{\phi}\) es la tasa de cambio del ángulo de orientación (rad/s).

---

## 3. Parámetros Utilizados

- $$\(m = 80 \, \text{kg}\)$$: Masa total del sistema.
- $$\(h = 1.2 \, \text{m}\)$$: Altura del centro de masa.
- $$\(L = 1.1 \, \text{m}\)$$: Longitud entre ejes.
- $$\(I = 8 \, \text{kg·m}^2\)$$: Momento de inercia.
- $$\(g = 9.81 \, \text{m/s}^2\)$$: Gravedad.
- $$\(v = 5 \, \text{m/s}\)$$: Velocidad inicial.
- $$\(\omega_{\phi} = 0.01 \, \text{rad/s}\)$$: Tasa de cambio del ángulo de orientación.

---

## 4. Gráficas Generadas

1. **Trayectoria $$(\(x, y\))$$:** Posición de la bicicleta en el plano inercial.
2. **Ángulo de inclinación $$(\(\theta(t)\))$$:** Variación del ángulo de inclinación con el tiempo.
3. **Ángulo de orientación $$(\(\phi(t)\))$$:** Variación del ángulo de orientación con el tiempo.

---

## 5. Simulaciones

Este modelo permite simular:
1. Movimiento en línea recta: $$\(\phi = 0\)$$.
2. Maniobras con orientación dinámica: $$\(\phi(t)\)$$ variable con $$\(\omega_{\phi}\)$$.

