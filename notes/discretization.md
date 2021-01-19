#### Linear 1-D Advection Equation
<br>

> *The rate of change of $u$ in time equals the advective speed $c$ times the spatial gradient of $u$.*
$$
{\partial u \over \partial t} + c{\partial u \over \partial x}
$$

----
#### Discretizing Partial Derivatives
<br>

> *Discretization is “the process of transferring continuous functions, models, variables, and equations into discrete counterparts. This process is usually carried out as a first step toward making them suitable for numerical evaluation and implementation on digital computers.”*

In a continuous function, we know the value of $u$ at time step $n$. We are trying to know the value of $u$ at time step $n+1$.


The Discrete approximation corresponds to the gradient times the speed. The higher the speed or the gradient, the steeper the line of discrete approximation.

To discretize time and space with finite differences:

* Rate of change of $u$ in time can be approximated as $u$ over time step ($\Delta u \over \Delta t$).
* The rate of change of $u$ in space can be approximated as $u$ over grid spacing ($\Delta u \over \Delta x$). 

* Finite difference in time
$$
{{u_i^{n+1}} - {u_i^n} \over \Delta t}
$$

* Finite difference in space
$$
{{u_i^{n}} - {u_{i-1}^n} \over \Delta t}
$$

---

#### Casting Derivatives Into Code
<br>

$$ \underbrace{u(i,n+1)}_{\text{Predicted value}} = \overbrace{u(i,n)}^{\text{Current value}} - \overbrace{c}^{\text{Advective velocity}} * \underbrace{(u(i,n) - u(i-1,n))}_{\text{Difference in space}} / \overbrace{dx}^{\text{Grid spacing}} * \underbrace{dt}_{\text{Time step}} $$

<br>

* Take the difference in space, $u(i,n) - u(i-1,n)$.
* Divide difference by grid spacing $dx$. $(u(i,n) -u(i-1,n))/dx$ = the rate of change in space.
* Multiply gradient by propagation speed $c$. $c * (u(i,n)-u(i-1,n))/dx$ = rate of change in time (tendency).
* Multiply tendency by time step, add to current value.