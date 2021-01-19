# Tsunami Simulator with parallel computing in modern Fortran

* Following along with [Modern Fortran: Building efficient parallel applications](https://www.manning.com/books/modern-fortran)
* Exploring the modernization efforts behind modern Fortran, the software world's oldest living language.
* Learning how Fortran's first-rate parallelism differs from that of Rust.
----
#### Linear 1-D Advection Equation
<br>

> *The rate of change of $u$ in time equals the advective speed $c$ times the spatial gradient of $u$.*

![test](../public/Linear-1-D-Advection-Equation.png)

----
#### Discretizing Partial Derivatives
<br>

> *Discretization is “the process of transferring continuous functions, models, variables, and equations into discrete counterparts. This process is usually carried out as a first step toward making them suitable for numerical evaluation and implementation on digital computers.”*

In a continuous function, we know the value of u at time step n. We are trying to know the value of u at time step n+1.


The Discrete approximation corresponds to the gradient times the speed. The higher the speed or the gradient, the steeper the line of discrete approximation.

To discretize time and space with finite differences:

* Rate of change of u in time can be approximated as u over time step (Δu/Δt).
* The rate of change of u in space can be approximated as u over grid spacing (Δu/Δx). 

* Finite difference in time

![test](../public/Finite-Difference-Time.png)

* Finite difference in space

![test](../public/Finite-Difference-Space.png)

---

#### Casting Derivatives Into Code
<br>

![test](../public/Casting-Derivatives-Into-Code.png)

<br>

* Take the difference in space, u(i,n) - u(i-1,n).
* Divide difference by grid spacing dx. (u(i,n) -u(i-1,n))/dx = the rate of change in space.
* Multiply gradient by propagation speed c. c * (u(i,n)-u(i-1,n))/dx = rate of change in time (tendency).
* Multiply tendency by time step, add to current value.