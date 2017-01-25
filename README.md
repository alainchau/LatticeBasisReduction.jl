## LatticeBasisReduction 
[![Build Status](https://travis-ci.org/pikachau/LatticeBasisReduction.jl.svg?branch=master)](https://travis-ci.org/pikachau/LatticeBasisReduction.jl)

### How to Install/Use
To install the package, enter the following in the Julia REPL:
```
julia> Pkg.clone("git://github.com/pikachau/LatticeBasisReduction.jl.git")
```

Here is an example of how to use the LLL algorithm:
```
julia> using LatticeBasisReduction

julia> x = [-2 7 7 -5; 3 -2 6 -1; 2 -8 -9 -7; 8 -9 6 -4]
4×4 Array{Int64,2}:
 -2   7   7  -5
  3  -2   6  -1
  2  -8  -9  -7
  8  -9   6  -4

julia> alpha = 1
1

julia> LLL(x, alpha, verbose=true)
iteration 1 	 exchange 	 k=2
iteration 2 	 reduce 	 k=2 	 ℓ=1 	 [μ[k,l]] = 1.0
iteration 3 	 reduce 	 k=3 	 ℓ=2 	 [μ[k,l]] = -1.0
iteration 4 	 reduce 	 k=3 	 ℓ=1 	 [μ[k,l]] = -1.0
iteration 5 	 exchange 	 k=4
iteration 6 	 reduce 	 k=3 	 ℓ=2 	 [μ[k,l]] = -1.0
iteration 7 	 exchange 	 k=3
iteration 8 	 reduce 	 k=2 	 ℓ=1 	 [μ[k,l]] = 1.0
iteration 9 	 reduce 	 k=3 	 ℓ=2 	 [μ[k,l]] = 1.0
iteration 10 	 reduce 	 k=3 	 ℓ=1 	 [μ[k,l]] = -1.0
iteration 11 	 reduce 	 k=4 	 ℓ=3 	 [μ[k,l]] = -1.0
iteration 12 	 exchange 	 k=4
iteration 13 	 reduce 	 k=3 	 ℓ=2 	 [μ[k,l]] = 1.0
iteration 14 	 exchange 	 k=3
iteration 15 	 exchange 	 k=2
iteration 16 	 exchange 	 k=3
iteration 17 	 reduce 	 k=2 	 ℓ=1 	 [μ[k,l]] = 1.0
iteration 18 	 exchange 	 k=2
iteration 19 	 exchange 	 k=4
iteration 20 	 reduce 	 k=3 	 ℓ=2 	 [μ[k,l]] = 1.0
iteration 21 	 exchange 	 k=3
iteration 22 	 reduce 	 k=2 	 ℓ=1 	 [μ[k,l]] = -1.0
iteration 23 	 exchange 	 k=2
4×4 Array{Float64,2}:
  2.0   3.0   1.0   1.0
  2.0   0.0  -2.0  -4.0
 -2.0   2.0   3.0  -3.0
  3.0  -2.0   6.0  -1.0

```
