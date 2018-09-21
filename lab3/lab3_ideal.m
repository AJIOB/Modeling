% clear workspace
clear;

% input config
pi1 = 0.8;
pi2 = 0.6;
qq1 = 1 - pi1;
qq2 = 1 - pi2;
piq_diag = pi1 * qq2 + pi2 * qq1;

% varialbles
syms p2000 p1000 p2010 p1010 p2011 p1001 p1011 p2111 p1111

% input eqs
normal = p2000 + p1000 + p2010 + p1010 + p2011 + p1001 + p1011 + p2111 + p1111 == 1;
eq1 = p2000 == 0;
eq2 = p1000 == p2000 * 1 + p2011 * qq1 * qq2 + p2010 * qq1;
eq3 = p2010 == p1001 * qq2 + p1010 * qq1 + p1011 * qq1 * qq2;
eq4 = p1010 == p2111 * qq1 * qq2 + p2011 * pi1 * qq2;
eq5 = p2011 == p1111 * qq1 * qq2 + p1001 * pi2 + p1011 * piq_diag;
eq6 = p1001 == p2011 * qq1 * pi2;
eq7 = p1011 == p2011 * pi1 * pi2 + p2111 * piq_diag;
eq8 = p2111 == p1011 * pi1 * pi2 + p1111 * (1 - qq1 * qq2);
eq9 = p1111 == p2111 * pi1 * pi2;

eqs = [eq1, eq2, eq3, eq4, eq5, eq6, eq7, eq8, normal];
vars = [p2000, p1000, p2010, p1010, p2011, p1001, p1011, p2111, p1111];

% solve
[A,B] = equationsToMatrix(eqs, vars);
X = linsolve(A,B);
sol.p2000 = X(1);
sol.p1000 = X(2);
sol.p2010 = X(3);
sol.p1010 = X(4);
sol.p2011 = X(5);
sol.p1001 = X(6);
sol.p1011 = X(7);
sol.p2111 = X(8);
sol.p1111 = X(9);

% Q
Q = 1 - sol.p1111 * pi1 * pi2;

% A
sol.pxx11 = sol.p2011 + sol.p1011 + sol.p2111 + sol.p1111;
sol.pxx10 = sol.p2010 + sol.p1010;
sol.pxx01 = sol.p1001;
p2 = qq1 * qq2 * sol.pxx11;
p1 = qq1 * sol.pxx10 + qq2 * sol.pxx01 + piq_diag * sol.pxx11;
A = 2 * p2 + 1 * p1;

% Wc
Lc = 1 * (sol.p2010 + sol.p1010 + sol.p1001) + 2 * (sol.p2011 + sol.p1011) + 3 * (sol.p2111 + sol.p1111);
Wc = Lc / A;

double(Q);
double(A);
double(Wc);
