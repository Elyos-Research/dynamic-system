# Ejemplo de Equaciones en Markdown

Este archivo demuestra cómo escribir ecuaciones matemáticas utilizando Markdown con soporte para LaTeX.

## Ecuaciones en Línea

Para incluir una ecuación en línea, utiliza `$` al principio y al final de la ecuación. Por ejemplo:

La fórmula de la ecuación cuadrática es $x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}$.

## Ecuaciones en Bloque

Para ecuaciones más complejas o que requieren un bloque separado, utiliza dos signos de dólar (`$$`). Por ejemplo:

$$
x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$

También puedes incluir sistemas de ecuaciones:

$$
\begin{aligned}
a + b &= c \\
d - e &= f
\end{aligned}
$$

## Notación Matricial

Markdown con LaTeX también admite matrices. Por ejemplo:

$$
\mathbf{A} = \begin{bmatrix}
a_{11} & a_{12} \\
a_{21} & a_{22}
\end{bmatrix}
$$

## Derivadas y Límites

Puedes expresar derivadas y límites fácilmente:

- Derivada: $\frac{dy}{dx} = 2x$
- Límite: $\lim_{x \to \infty} \frac{1}{x} = 0$

## Integrales

$$
\int_a^b x^2 \, dx = \frac{b^3}{3} - \frac{a^3}{3}
$$

