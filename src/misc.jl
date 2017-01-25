"""
Round to the nearest integer.
If the number is halfway between two integers,
then round down. (See definition 2.8 (pg 27) of Bremner.)
"""
function round_ties_down{T<:AbstractFloat}(x::T)
    if abs(floor(x) - x) == 0.5
        round(x, RoundDown)
    else
        round(x)
    end
end

round_ties_down{T<:Integer}(x::T) = x
