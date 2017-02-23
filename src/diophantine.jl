using DataStructures

"""
Take a stack consisting of the convergents of the continued
fraction expansion of a number and return the rational approximation.

Note: This function makes a deep copy of the given stack.

Ex.
    [3, 7, 15] ---> 333/106

julia> st = Stack(Int)
DataStructures.Stack{Int64}(Deque [Int64[]])

julia> push!(st, 3)
DataStructures.Stack{Int64}(Deque [[3]])

julia> push!(st, 7)
DataStructures.Stack{Int64}(Deque [[3,7]])

julia> push!(st, 15)
DataStructures.Stack{Int64}(Deque [[3,7,15]])

julia> stack_to_rational(st)
333//106
"""
function stack_to_rational(st)
    tmp = deepcopy(st)
    x = pop!(tmp)

    while (length(tmp) > 0)
        x = pop!(tmp) + 1 // x
    end

    return x
end


"""
Return a rational approximation of x with an error tolerance of ε (default value of 10^-5).

Using notation from Bremner (pg 146).

julia> diophantine(float(π))
355//113
"""
function diophantine(x, ε = 10.0^-5)
    st = Stack(Int)

    # step i=2
    γ = x
    qi = floor(Int, γ)
    push!(st, qi)

    # step i=3,4,...
    while (abs(stack_to_rational(st) - x) > ε)
        γ = 1 / (γ - qi)
        qi = floor(Int, γ)
        push!(st, qi)
    end

    return stack_to_rational(st)
end
