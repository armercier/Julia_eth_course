md"""
## Exercise 4 - **Nonlinear steady-state diffusion 2D**
"""

#md # 👉 See [Logistics](/logistics/#submission) for submission details.

md"""
The goal of this exercise is to:
- Investigate second-order acceleration
- Implement a fast implicit nonlinear diffusion solver in 2D
"""

md"""
In this exercise you will transform the fast implicit nonlinear diffusion 1D solver from Exercise 3 to 2D.

To get started, save a copy of the `diffusion_nl_1D_steady_2.jl` script from Exercise 3 - Task 2, and name it `diffusion_nl_2D_steady_2.jl`.
"""

md"""
### Task 1
You will port the 1D code to 2D, duplicating, if needed, all parameters from the $x$-dimension to the $y$-dimension.

In the `# Array initialisation`, use following functions to initialise 3 ellipses where the subsurface permeability is reduced from 5.0 to 1.5:

```julia
rad2_1 = (xc .- 2*Lx/3).^2 .* 3 .+ (yc' .-   Ly/3).^2 ./ 4
rad2_2 = (xc .- 2*Lx/3).^2 ./ 4 .+ (yc' .- 2*Ly/3).^2 .* 3
rad2_3 = (xc .-   Lx/3).^2 .* 1 .+ (yc' .-   Ly/2).^2 ./ 1
```

Use these "radius" functions to set values of `D0` to 1.5 when smaller then 1.0.

As boundary conditions, set `C=0.5` at $x=dx/2$ and `C=0.1` at $x=Lx-dx/2$. Implement a "no-flux" boundary condition ($∆C$ vanishes in the direction orthogonal to the boundary) at $y=dy/2$ and $y=Ly-dy/2$.

You will adapt the parameters and the implementation. For the `# Physics`, set the total simulation time `ttot=200.0` and move the `D0` initialisation to the `# Array initialisation` section.
"""

#nb # > 💡 hint: Take care to adapt the iterative time step condition for 2D diffusion and think about how to modify the `maxloc` function for 2D purposes.`
#md # \note{Take care to adapt the iterative time step condition for 2D diffusion and think about how to modify the `maxloc` function for 2D purposes.}

md"""
Report graphically the distribution of concentration `C` as function of `x` and `y` using a heatmap plot, adding axes labels and title reporting time, iteration count and current error.
"""
