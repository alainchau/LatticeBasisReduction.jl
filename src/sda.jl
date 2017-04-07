"""
    sda(x...; beta = 2, eps = 1/100)

Input: list of real distinct numbers.
Output: list of numerators and a common denominator.

Simultaneous diophantine approximation.
I.e. given a list of n distinct real numbers, find rational
approximations using the same denominators.


```julia
julia> sda(sqrt(2), sqrt(3), sqrt(5), sqrt(7))
([22253,27132,35112,41514],15708)
```
"""
function sda(x...; beta=2, eps=1/100)
    β = beta
    ε = eps
    n = length(x)
    A = - eye(n + 1)

    A[1,1] = β^(-n*(n+1)/4) * ε^(n+1)

    for i in 1:n
        A[1,i+1] = diophantine(x[i], ε)
    end

    C, X = LLL(A, 1/4 + 1/β, return_c = true)

    C = Array{Int}(C)

    if sign(C[1,1]) == -1
        return -C[1, 2:end], -C[1, 1]
    else
        return C[1, 2:end], C[1, 1]
    end

end
