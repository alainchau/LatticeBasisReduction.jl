"""
Round to the nearest integer.
If the number is halfway between two integers,
then round down. (See definition 2.8 (pg 27) of Bremner.)
"""
function round_ties_down(x::Float64)
    if abs(floor(x) - x) == 0.5
        return round(x, RoundDown)
    else
        return round(x)
    end
end
