"""
Round to the nearest integer.
If the number is halfway between two integers,
then round down. (See definition 2.8 (pg 27) of Bremner.)

Motivation: The built-in round function sends -0.5 to 0 instead of -1.
This function correctly handles negative numbers per the examples in Bremner.
"""
function round_ties_down(x::T) where {T<:AbstractFloat}
    if abs(floor(x) - x) == 0.5
        round(Int, x, RoundDown)
    else
        round(Int, x)
    end
end

round_ties_down(x::T) where {T<:Integer} = x
