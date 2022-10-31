md"""
## Exercise 2 - **3D thermal porous convection xPU implementation**
"""

#md # 👉 See [Logistics](/logistics/#submission) for submission details.

md"""
The goal of this exercise is to:
- Create a 3D xPU implementation of the 2D thermal porous convection code
- Familiarise with 3D and xPU programming, `@parallel` and `@parallel_indices`
- Include 3D visualisation using [`Makie.jl`](https://docs.makie.org/stable/)
"""

md"""
In this exercise, you will finalise the 3D fluid diffusion solver started during lecture 7 and use the new xPU scripts as starting point to port your 3D thermal porous convection code.
"""

md"""
For this first exercise, we will finalise and add to the `scripts` folder within the `PorousConvection` folder following scripts:
- `Pf_diffusion_3D_xpu.jl`
- `PorousConvection_3D_xpu.jl`

### Task 1

Finalise the `Pf_diffusion_3D_xpu.jl` script from class.
- This version should contain compute functions (kernels) definitions using `@parallel` approach together with using `ParallelStencil.FiniteDifferences2D` submodule.
- Include the kwarg `do_visu` (or `do_check`) to allow disabling plotting/error-checking when assessing performance.
- Also, make sure to include and update the performance evaluation section at the end of the script.

### Task 2

Merge the `PorousConvection_2D_xpu.jl` from Exercise 1 and the `Pf_diffusion_3D_xpu.jl` script from previous task to create a 3D single xPU `PorousConvection_3D_xpu.jl` version to run on GPUs.

Implement similar changes as you did in the previous 2 tasks, preferring the `@parallel` (instead of `@parallel_indices`) whenever possible.

Make sure to use the `z`-direction as the vertical coordinate changing all relevant expressions in the code, and assume `αρg` to be the gravity acceleration acting only in the `z`-direction. Implement following domain extend and numerical resolution (ratio):
"""

## physics
lx,ly,lz    = 40.0,20.0,20.0
αρg         = 1.0
Ra          = 1000
λ_ρCp       = 1/Ra*(αρg*k_ηf*ΔT*lz/ϕ) # Ra = αρg*k_ηf*ΔT*ly/λ_ρCp/ϕ
## numerics
nz          = 63
ny          = nz
nx          = 2*(nz+1)-1
nt          = 500
cfl         = 1.0/sqrt(3.1)


