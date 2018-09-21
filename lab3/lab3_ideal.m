% clear workspace
clear

pi1 = 0.8
pi2 = 0.6
qq1 = 1 - pi1
qq2 = 1 - pi2

syms p2000 p1000 p2010 p1010 p2011 p1001 p1011 p2111 p1111

normal = p2000 + p1000 + p2010 + p1010 + p2011 + p1001 + p1011 + p2111 + p1111 == 1
eq1 = p2000 == 0
eq2 = p1000 == p2000 * 1 + p2011 * qq1 * qq2 + p2010 * qq1
eq3 = p2010 == p1001 * qq2 + p1010 * qq1 + p1011 * qq1 * qq2
eq4 = p1010 == p2111 * qq1 * qq2 + p2011 * pi1 * qq2
% TODO: add more eqs

eqs = [eq1, eq2, eq3, eq4]
vars = [p2000, p1000, p2010, p1010, p2011, p1001, p1011, p2111, p1111]

sol = solve(eqs, vars)
