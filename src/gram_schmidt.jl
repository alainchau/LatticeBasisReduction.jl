"""
    gram_schmidt(A::Array[, ret_coef_mat::Bool])

Return orthogonalized basis.
Optionally returns the Gram-Schmidt coefficient matrix using the ret_coef_mat parameter.

# Example

```julia
julia> x = [
        [ 3  -1   5]
        [-5   2  -1]
        [-3   9   2]
    ]

julia> gram_schmidt(x)
3×3 Array{Float64,2}:
  3.0      -1.0       5.0
 -3.11429   1.37143   2.14286
  2.68728   6.5689   -0.298587

```
"""
function gram_schmidt(A::Array{T, 2}; ret_coef_mat::Bool = false) where {T<:AbstractFloat}
    # Assume the vectors are given as row vectors of X
    # Maybe redo later since vectors in Julia are stored in column-major order.

    X = transpose(copy(A))
    X_star = zeros(size(X))

    # Coefficient matrix
    μ = zeros(size(X))

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

function gram_schmidt(A::Array{T, 2}; ret_coef_mat::Bool = false) where {T<:Integer}
    gram_schmidt(float(A), ret_coef_mat=ret_coef_mat)
end
