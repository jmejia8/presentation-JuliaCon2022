### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 286b7e2b-8773-4197-9fe1-9b32844604ac
begin
	using PlutoUI
	using Metaheuristics
end

# ╔═╡ b76eeb4e-fb24-11ec-19cd-a148bff6f292
html"<button onclick='present()'>Start Presentation</button>"

# ╔═╡ bf13fad4-21a0-4ad5-ad6a-bf75ffc8a6d5
TableOfContents()

# ╔═╡ f0ecd7e3-30b6-46ff-8323-015e560c2a0c
md"""
# Metaheuristics.jl: Towards Any Optimization

 ![Metaheuristics Logo](https://raw.githubusercontent.com/jmejia8/Metaheuristics.jl/master/docs/src/assets/logo-big.png)

- **Jesús-Adolfo Mejía-de-Dios**
- Twitter: **_jmejia**

"""

# ╔═╡ 3bcdf9d2-b2f2-4e68-a505-b9b1a6078c63
md"""
## Introduction



![Optimization problem](https://raw.githubusercontent.com/jmejia8/Metaheuristics.jl/master/docs/src/figs/rastrigin.png)

`Metaheuristics.jl` is a framework that contains **metaheuristics** for hard optimization problems.

- Evolutionary Algorithms: `GA`, `DE`, etc.
- Swarm Swarm Intelligence: `PSO`, `ABC`.
- Bio-inspired optimizer: `ECA`, `GSA`, etc.

Suitable for constrained, multi-, many-objective and bilevel optimization. 
"""

# ╔═╡ d036f1e3-d2c7-421a-85f3-78a1584b84bc
md"""
## Installation

Open the Julia REPL and press `]` to open the Pkg prompt:

```
pkg> add Metaheuristics
```

Or, equivalently, via the `Pkg` API:

```julia
julia> import Pkg; Pkg.add("Metaheuristics")
```
"""

# ╔═╡ 8e324eb2-25a0-421c-a583-5094d312c00d
md"""
## Main Features


- Consistent API: 
```julia
optimize(f, bounds, method)
```
- A lot of optimization `methods` (+15).
- Include **constraint handling** strategies.
- Support for single-, multi-, many-objective optimization. 
- Contain scalable test problems.
- Visualization in console via [UnicodePlots.jl](https://github.com/JuliaPlots/UnicodePlots.jl).
```
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀F space⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ 
        ┌────────────────────────────────────────┐ 
      2 │⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│ 
        │⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│ 
        │⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│ 
        │⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│ 
        │⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│ 
        │⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│ 
        │⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│ 
   f₂   │⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│ 
        │⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│ 
        │⠈⢢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│ 
        │⠀⠀⠙⠦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│ 
        │⠀⠀⠀⠀⠈⠑⠦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│ 
        │⠀⠀⠀⠀⠀⠀⠀⠀⠉⠒⠤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│ 
        │⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠑⠒⠤⠤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│ 
      0 │⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠑⠒⠐⠢⠤⠠⠤⢄⢀⣀⡀⣀⣀⢀⣀⡀⣀⣀│ 
        └────────────────────────────────────────┘ 
        ⠀0⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀1⠀ 
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀f₁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ 
```

"""

# ╔═╡ 142914fb-5b56-465f-b597-a80a1030549c
md"""
## Quick Start

Minimize:

$f(x) = \sum_{i=1}^n (x_i - 1.234)^2$
with $x \in [-6, 6]^n,\ n = 5$.

Optimize in three lines!
"""

# ╔═╡ 11134431-54ef-4d9f-9b6f-9676df1645d2
f(x) = sum((x .- 1.234).^2)

# ╔═╡ 2ed36442-f6de-4243-90d4-aed313fdd271
bounds = repeat([-6., 6.], 1, 5)

# ╔═╡ 56e42c74-68e4-46fd-bf1b-8b26791f5115
results = optimize(f, bounds)

# ╔═╡ 19c7511b-cd74-4f66-b148-38f1030f397f
md"""
### Analysing the Results
"""

# ╔═╡ a0729630-0198-4291-9838-bd0a7108ff4f
minimizer(results)

# ╔═╡ 873ecc84-9498-4a3a-a3a7-c3e2ad41e97f
minimum(results)

# ╔═╡ 18393db7-a3f1-4052-84a3-730360d4bd03
results.population

# ╔═╡ 2cd3659b-e096-4690-9d87-653e747f613f
termination_status_message(results)

# ╔═╡ 36eba6ca-bdff-48f5-b8b0-ac9c3f68532b
md"""
### Selecting a Metaheuristic

Possible optimizers: `ECA, DE, PSO, ABC, GSA, SA, WOA, MCCGA, ...`
"""

# ╔═╡ 1382f72c-5477-4eba-aaf2-787db778ef03
optimize(f, bounds, PSO())

# ╔═╡ 56875cdb-da71-4bdd-a675-bd8cc96add37
md"""
## Options and Information

You can change common options using `Options()`

Parameters and common options:
```
OPTIMIZER(args; kargs..., options, information)
```

"""

# ╔═╡ a5cd3634-33b0-4440-be8d-b6c86bc42b67
options = Options(f_calls_limit=20_000, seed=1, f_tol=1e-5);

# ╔═╡ 4f84c95a-f926-4564-82e1-4422829e84c6
information = Information(f_optimum=0.0);

# ╔═╡ 108c3564-03d9-4acd-a652-f4884a05a74d
optimize(f, bounds, ECA(;options, information))

# ╔═╡ ea13314e-0dd0-48f3-8dbd-a6ec2e282f18
md"""
## Constrained Optimization

Minimize:

```math
{\displaystyle f(x,y)=(1-x)^{2}+100(y-x^{2})^{2}}
```
subject to:

```math
{\displaystyle x^{2}+y^{2}\leq 2}
```
where $-2 \leq x,y \leq 2$.
"""

# ╔═╡ 9d326f84-d152-4a3a-bcc5-ac3fe5e419b8
function f_constrained(x⃗)
    x,y = x⃗[1], x⃗[2]
    fx = (1-x)^2+100(y-x^2)^2 # Objective function
    gx = x^2 + y^2 - 2        # inequality constraints
    hx = 0.0                  # equality constraints
    # order is important
    fx, [gx], [hx]
end

# ╔═╡ dfd2d386-0b52-4ac4-bf00-cff29ce6cbfa
bounds_constrained = [-2.0 -2; 2 2];

# ╔═╡ 2dd0f115-8c3e-40a5-b4f1-ae2a434f417a
optimize(f_constrained, bounds_constrained, DE(N=50))

# ╔═╡ 3714538e-e586-475b-8b75-89d1aae31b8c
md"""
## Multi-Objective Optimization

A Multi-objective problem aims to minimize multiple conflicting objectives simultaneously.

Minimize: 

$F(x) = \begin{pmatrix}f_1(x)\\ f_2(x) \\ \vdots \\ f_m(x) \end{pmatrix}$

Availabel methods: `MOEA/D-DE, NSGA-II, NSGA-III, SMS-EMOA, SPEA2, CCMO,...`

### Example

Here, you need to provide constraints if they exist, otherwise put `gx = [0.0]; hx = [0.0];`
to indicate an unconstrained multiobjective problem.
"""


# ╔═╡ 6bb585b7-b40e-4887-a41f-28e08316317d
function f_mo(x)
    v = 1.0 + sum(x .^ 2)
    # objective functions
    fx1 = x[1] * v
    fx2 = (1 - sqrt(x[1])) * v

	
    # constraints
    gx = [0.0] # inequality constraints
    hx = [0.0] # equality constraints

    # order is important
    return [fx1, fx2], gx, hx
end

# ╔═╡ 7777c4ce-69e3-4b57-9952-9cc17112dfc9
bounds_mo = [zeros(10) ones(10)];

# ╔═╡ 35e3ac1a-0891-4f09-b4ee-c05772e70ff4
result_mo = optimize(f_mo, bounds_mo, NSGA2())

# ╔═╡ ba556627-5487-4384-b8b9-7886d6e3ea8d
pareto_front(result_mo)

# ╔═╡ 74f70ba2-d310-44b1-ab9a-9dc0f60fe1db
md"""
## Test Problems
"""

# ╔═╡ ab39b621-5387-4980-b07e-e1c497b988f7
F, boundaries, pf = Metaheuristics.TestProblems.get_problem(:DTLZ2);

# ╔═╡ acce65a8-5394-4ee0-9b65-f36ced878da9
boundaries

# ╔═╡ e946125d-1035-4988-96e0-3376cdb52432
pf

# ╔═╡ 80d5e0f8-7275-466a-a3f2-1a09c7cedbfc
optimize(F, boundaries, SPEA2())

# ╔═╡ 035775a9-e913-4d3f-910c-2727e36bb446
md"""
## Multi-Criteria Decision-Making

Decision-making has to be performed after an optimizer reported a set of non-dominated solutions.
"""

# ╔═╡ de3a7763-14b8-4183-9c2b-131c19ee7dd1
result_mo.population

# ╔═╡ d627c8d3-2bd0-44f9-a8e0-d93529a869c2
# prefrences
w = [0.5, 0.5]

# ╔═╡ 0965b8f5-b9c3-4210-b257-5732486170c4
sol = best_alternative(result_mo, w, CompromiseProgramming(Tchebysheff()))

# ╔═╡ 2a86b751-4607-43f7-8ffd-00faf41a278a
md"""

### Interface for JMcDM

JMcDM is a package for MCDM developed by [Mehmet Hakan Satman, Bahadır Fatih Yıldırım, Ersagun Kuruca (2021)](https://jmejia8.github.io/Metaheuristics.jl/stable/references/#Satman2021JMcDM). 
Many methods have been implemented there, and many of them have been interfaced here.

The main method to use JMcDM within Metaheuristics is described as follows.

```
mcdm(data, w, method)
```
Supported MCDM methods:

* `ArasMethod`
* `CocosoMethod`
* `CodasMethod`
* `TopsisMethod` **(default)**
* ... and many more.
"""

# ╔═╡ 48fdba46-abfd-43ff-9484-4a37582db392
md"""
### Conclusions and Future Work

`Metaheuristics.jl` can be used for different kind of optimization problems.
It contains challenging benchmark problems for testing algorithms, visualization features, multi-criteria decision-making, and performance indicators to assess the algorithm performance.

**Future Work:**

- Island-based Optimization (parallel/distributed algorithms)
- Visualizaton recipes for Plots/Makie
- Methods for trivial comparisons among algorithms

"""

# ╔═╡ e242ff2a-3359-4d53-b278-5bb3f63ea596
md"""
## Thank you for your attention!

**Contact:**

- Jesús-Adolfo Mejía-de-Dios
- WEB: [bi-level.org/jmejia](https://bi-level.org/jmejia/)
- Twitter: **_jmejia**
- GitHub: [github.com/jmejia8](https://github.com/jmejia8)
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Metaheuristics = "bcdb8e00-2c21-11e9-3065-2b553b22f898"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
Metaheuristics = "~3.2.8"
PlutoUI = "~0.7.39"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.2"
manifest_format = "2.0"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "af92965fb30777147966f58acb05da51c5616b5f"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.3.3"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[deps.CEnum]]
git-tree-sha1 = "eb4cb44a499229b3b8426dcfb5dd85333951ff90"
uuid = "fa961155-64e5-5f13-b03f-caf6b980ea82"
version = "0.4.2"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "2dd813e5f2f7eec2d1268c57cf2373d3ee91fcea"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.15.1"

[[deps.ChangesOfVariables]]
deps = ["ChainRulesCore", "LinearAlgebra", "Test"]
git-tree-sha1 = "1e315e3f4b0b7ce40feded39c73049692126cf53"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.3"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.ColorVectorSpace]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "SpecialFunctions", "Statistics", "TensorCore"]
git-tree-sha1 = "d08c20eef1f2cbc6e60fd3612ac4340b89fea322"
uuid = "c3611d14-8923-5661-9e6a-0046d554d3a4"
version = "0.9.9"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "417b0ed7b8b838aa6ca0a87aadf1bb9eb111ce40"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.8"

[[deps.Compat]]
deps = ["Dates", "LinearAlgebra", "UUIDs"]
git-tree-sha1 = "924cdca592bc16f14d2f7006754a621735280b74"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.1.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.ConstructionBase]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "c096d0e321368ac23eb1be1ea405814f8b32adb3"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.3.1"

[[deps.Contour]]
deps = ["StaticArrays"]
git-tree-sha1 = "9f02045d934dc030edad45944ea80dbd1f0ebea7"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.5.7"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.DataAPI]]
git-tree-sha1 = "fb5f5316dd3fd4c5e7c30a24d50643b73e37cd40"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.10.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Distances]]
deps = ["LinearAlgebra", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "3258d0659f812acde79e8a74b11f17ac06d0ca04"
uuid = "b4f34e82-e78d-54a5-968a-f98e89d6e8f7"
version = "0.10.7"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "b19534d1895d702889b219c382a6e18010797f0b"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.6"

[[deps.Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[deps.EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3f3a2501fa7236e9b911e0f7a588c657e822bb6d"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.2.3+0"

[[deps.FileIO]]
deps = ["Pkg", "Requires", "UUIDs"]
git-tree-sha1 = "9267e5f50b0e12fdfd5a2455534345c4cf2c7f7a"
uuid = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
version = "1.14.0"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.FreeType]]
deps = ["CEnum", "FreeType2_jll"]
git-tree-sha1 = "cabd77ab6a6fdff49bfd24af2ebe76e6e018a2b4"
uuid = "b38be410-82b0-50bf-ab77-7b57e271db43"
version = "4.0.0"

[[deps.FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "87eb71354d8ec1a96d4a7636bd57a7347dde3ef9"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.10.4+0"

[[deps.FreeTypeAbstraction]]
deps = ["ColorVectorSpace", "Colors", "FreeType", "GeometryBasics"]
git-tree-sha1 = "b5c7fe9cea653443736d264b85466bad8c574f4a"
uuid = "663a7486-cb36-511b-a19d-713bb74d65c9"
version = "0.9.9"

[[deps.GeometryBasics]]
deps = ["EarCut_jll", "IterTools", "LinearAlgebra", "StaticArrays", "StructArrays", "Tables"]
git-tree-sha1 = "83ea630384a13fc4f002b77690bc0afeb4255ac9"
uuid = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
version = "0.4.2"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "b3364212fb5d870f724876ffcd34dd8ec6d98918"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.7"

[[deps.IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

[[deps.IterTools]]
git-tree-sha1 = "fa6287a4469f5e048d763df38279ee729fbd44e5"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.4.0"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.LazyModules]]
git-tree-sha1 = "a560dd966b386ac9ae60bdd3a3d3a326062d3c3e"
uuid = "8cdb02fc-e678-4876-92c5-9defec4f444e"
version = "0.3.1"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "09e4b894ce6a976c354a69041a04748180d43637"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.15"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MarchingCubes]]
deps = ["StaticArrays"]
git-tree-sha1 = "3bf4baa9df7d1367168ebf60ed02b0379ea91099"
uuid = "299715c1-40a9-479a-aaf9-4a633d36f717"
version = "0.1.3"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[deps.Metaheuristics]]
deps = ["Distances", "LinearAlgebra", "Pkg", "Printf", "Random", "Requires", "Statistics", "Test", "UnicodePlots"]
git-tree-sha1 = "ddc4f3e3aa7fca9140c5e512bbb398ef25955cf8"
uuid = "bcdb8e00-2c21-11e9-3065-2b553b22f898"
version = "3.2.8"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[deps.NaNMath]]
git-tree-sha1 = "737a5957f387b17e74d4ad2f440eb330b39a62c5"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.0.0"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "0044b23da09b5608b4ecacb4e5e6c6332f833a7e"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.3.2"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "8d1f54886b9037091edf146b517989fc4a09efec"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.39"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "47e5f437cc0e7ef2ce8406ce1e7e24d44915f88d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.3.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.SpecialFunctions]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "a9e798cae4867e3a41cae2dd9eb60c047f1212db"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.1.6"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "Random", "StaticArraysCore", "Statistics"]
git-tree-sha1 = "9f8a5dc5944dc7fbbe6eb4180660935653b0a9d9"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.5.0"

[[deps.StaticArraysCore]]
git-tree-sha1 = "66fe9eb253f910fe8cf161953880cfdaef01cdf0"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.0.1"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "2c11d7290036fe7aac9038ff312d3b3a2a5bf89e"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.4.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "48598584bacbebf7d30e20880438ed1d24b7c7d6"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.18"

[[deps.StructArrays]]
deps = ["Adapt", "DataAPI", "StaticArrays", "Tables"]
git-tree-sha1 = "ec47fb6069c57f1cee2f67541bf8f23415146de7"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.11"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "OrderedCollections", "TableTraits", "Test"]
git-tree-sha1 = "5ce79ce186cc678bbb5c5681ca3379d1ddae11a1"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.7.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[deps.TensorCore]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1feb45f88d133a655e001435632f019a9a1bcdb6"
uuid = "62fd8b95-f654-4bbd-a8a5-9c27f68ccd50"
version = "0.1.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.UnicodePlots]]
deps = ["ColorTypes", "Contour", "Crayons", "Dates", "FileIO", "FreeTypeAbstraction", "LazyModules", "LinearAlgebra", "MarchingCubes", "NaNMath", "Printf", "SparseArrays", "StaticArrays", "StatsBase", "Unitful"]
git-tree-sha1 = "ae67ab0505b9453655f7d5ea65183a1cd1b3cfa0"
uuid = "b8865327-cd53-5732-bb35-84acbb429228"
version = "2.12.4"

[[deps.Unitful]]
deps = ["ConstructionBase", "Dates", "LinearAlgebra", "Random"]
git-tree-sha1 = "b649200e887a487468b71821e2644382699f1b0f"
uuid = "1986cc42-f94f-5a68-af5c-568840ba703d"
version = "1.11.0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╠═286b7e2b-8773-4197-9fe1-9b32844604ac
# ╟─b76eeb4e-fb24-11ec-19cd-a148bff6f292
# ╟─bf13fad4-21a0-4ad5-ad6a-bf75ffc8a6d5
# ╟─f0ecd7e3-30b6-46ff-8323-015e560c2a0c
# ╟─3bcdf9d2-b2f2-4e68-a505-b9b1a6078c63
# ╟─d036f1e3-d2c7-421a-85f3-78a1584b84bc
# ╟─8e324eb2-25a0-421c-a583-5094d312c00d
# ╟─142914fb-5b56-465f-b597-a80a1030549c
# ╠═11134431-54ef-4d9f-9b6f-9676df1645d2
# ╠═2ed36442-f6de-4243-90d4-aed313fdd271
# ╠═56e42c74-68e4-46fd-bf1b-8b26791f5115
# ╟─19c7511b-cd74-4f66-b148-38f1030f397f
# ╠═a0729630-0198-4291-9838-bd0a7108ff4f
# ╠═873ecc84-9498-4a3a-a3a7-c3e2ad41e97f
# ╠═18393db7-a3f1-4052-84a3-730360d4bd03
# ╠═2cd3659b-e096-4690-9d87-653e747f613f
# ╠═36eba6ca-bdff-48f5-b8b0-ac9c3f68532b
# ╠═1382f72c-5477-4eba-aaf2-787db778ef03
# ╟─56875cdb-da71-4bdd-a675-bd8cc96add37
# ╠═a5cd3634-33b0-4440-be8d-b6c86bc42b67
# ╠═4f84c95a-f926-4564-82e1-4422829e84c6
# ╠═108c3564-03d9-4acd-a652-f4884a05a74d
# ╟─ea13314e-0dd0-48f3-8dbd-a6ec2e282f18
# ╠═9d326f84-d152-4a3a-bcc5-ac3fe5e419b8
# ╠═dfd2d386-0b52-4ac4-bf00-cff29ce6cbfa
# ╠═2dd0f115-8c3e-40a5-b4f1-ae2a434f417a
# ╟─3714538e-e586-475b-8b75-89d1aae31b8c
# ╠═6bb585b7-b40e-4887-a41f-28e08316317d
# ╠═7777c4ce-69e3-4b57-9952-9cc17112dfc9
# ╠═35e3ac1a-0891-4f09-b4ee-c05772e70ff4
# ╠═ba556627-5487-4384-b8b9-7886d6e3ea8d
# ╟─74f70ba2-d310-44b1-ab9a-9dc0f60fe1db
# ╠═ab39b621-5387-4980-b07e-e1c497b988f7
# ╠═acce65a8-5394-4ee0-9b65-f36ced878da9
# ╠═e946125d-1035-4988-96e0-3376cdb52432
# ╠═80d5e0f8-7275-466a-a3f2-1a09c7cedbfc
# ╟─035775a9-e913-4d3f-910c-2727e36bb446
# ╠═de3a7763-14b8-4183-9c2b-131c19ee7dd1
# ╠═d627c8d3-2bd0-44f9-a8e0-d93529a869c2
# ╠═0965b8f5-b9c3-4210-b257-5732486170c4
# ╟─2a86b751-4607-43f7-8ffd-00faf41a278a
# ╟─48fdba46-abfd-43ff-9484-4a37582db392
# ╟─e242ff2a-3359-4d53-b278-5bb3f63ea596
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
