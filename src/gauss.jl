"""
    gauss(x, y)

Input: A basis {x,y} of a lattice L in R^n.
Output: A minimal basis v1, v2 of the lattice L.

The basis v1, v2 is minimal if
    - v1 is the shortest nonzero vector in L and
    - v2 is the shortest vector in L which is not a multiple of v1.

# Example 2.9 (Bremner)
```
julia> x = [-56, 43]
julia> y = [95, -73]
julia> gauss(x,y)
([1,1], [-1,2])
```
"""
function gauss(x, y)
    if norm(x) <= norm(y)
        v1, v2 = x, y
    else
        v1, v2 = y, x
    end

    finished = false
    while (!finished)
        m = round_ties_down(dot(v2, v1) / dot(v1, v1))
        v2 = v2 - m * v1

        if norm(v1) <= norm(v2)
            finished = true
        else
            v1, v2 = v2, v1
        end
    end

    return v1, v2
end
