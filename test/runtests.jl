using LatticeBasisReduction
using Base.Test

# Custom rounding
@test LatticeBasisReduction.round_ties_down(1.3) == 1
@test LatticeBasisReduction.round_ties_down(1.5) == 1
@test LatticeBasisReduction.round_ties_down(1.6) == 2
@test LatticeBasisReduction.round_ties_down(2) == 2
@test LatticeBasisReduction.round_ties_down(-0.5) == -1

# Verify gram schmidt process with example 3.3 from Bremner
eps = 1e-3
@test_approx_eq_eps gram_schmidt([3 -1 5; -5 2 -1; -3 9 2]) [3 -1 5; -109/35 48/35 15/7; 1521/566 1859/283 -169/566] eps

# Verify LLL algorithm
x = [[-2 7 7 -5]
     [3 -2 6 -1]
     [2 -8 -9 -7]
     [8 -9 6 -4]]

@test_approx_eq_eps LLL(x, 1) [2 3 1 1; 2 0 -2 -4; -2 2 3 -3; 3 -2 6 -1] eps
@test_approx_eq_eps LLL(x, 1.) [2 3 1 1; 2 0 -2 -4; -2 2 3 -3; 3 -2 6 -1] eps
@test_approx_eq_eps LLL(Array{Float64}(x), 1) [2 3 1 1; 2 0 -2 -4; -2 2 3 -3; 3 -2 6 -1] eps

# Verify diophantine approximation for a single number
@test diophantine(float(π)) == 355//113

# Verify gauss for minimal basis of a lattice in R^2
x = [-56, 43]; y = [95, -73]
@test gauss(x,y) == ([1,1],[-1,2])
@test gauss(y,x) == ([1,1],[-1,2])

# Verify Simulataneous Diophantine Approximation
nums, dem = sda(sqrt(2), sqrt(3), sqrt(5), sqrt(7), ε = eps)
@test_approx_eq_eps nums[1]/dem sqrt(2) eps
@test_approx_eq_eps nums[2]/dem sqrt(3) eps
@test_approx_eq_eps nums[3]/dem sqrt(5) eps
@test_approx_eq_eps nums[4]/dem sqrt(7) eps
