"""
Return orthogonal basis and the Gram Schmidt coefficient matrix.

# Example

```julia
julia> X = (Float64)[
        [ 3  -1   5]
        [-5   2  -1]
        [-3   9   2]
    ]

julia> X_star, M = gram_schmidt(X)
(
[3.0 -1.0 5.0; -3.11429 1.37143 2.14286; 2.68728 6.5689 -0.298587],

[1.0 0.0 0.0; -0.628571 1.0 0.0; -0.228571 1.60601 1.0])
```
"""
function gram_schmidt{T<:AbstractFloat}(A::Array{T, 2}; ret_coef_mat::Bool = false)
    # Assume the vectors are given as row vectors of X
    # Maybe redo later since vectors in Julia are stored in column-major order.

    X = transpose(copy(A))
    X_star = zeros(X)

    # Coefficient matrix
    μ = zeros(X)

    n_cols = size(X)[2]
    for i in 1:n_cols
        X_star[:, i] = X[:, i]
        for j in 1:i-1
            t = dot(X[:, i], X_star[:, j]) / dot(X_star[:, j], X_star[:, j])
            μ[j, i] = t
            X_star[:, i] -= (t * X_star[:, j])
        end
        μ[i,i] = 1
    end

    if ret_coef_mat
        transpose(X_star), transpose(μ)
    else
        transpose(X_star)
    end
end

function gram_schmidt{T<:Integer}(A::Array{T, 2}; ret_coef_mat::Bool = false)
    gram_schmidt(float(A), ret_coef_mat=ret_coef_mat)
end
