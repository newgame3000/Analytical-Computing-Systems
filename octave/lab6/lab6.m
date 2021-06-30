
[x, y, z] = ndgrid(-11.0 : 0.1 : 11.0, -11.0 : 0.1 : 11.0, -11.0 : 0.1 : 11.0);

u = -2*y.^2 + 4*y.*z - 3*z.^2 + 4*y + 4*z - 12;

A = [
    [0, 0, 0];
    [0, -2, 2];
    [0, 2, -3]
];

B = [0; 2; 2]

a0 = -12

AlE = poly(A);
disp("Характеристический многочлен:");
polyout(AlE, 'l');

eigenvalues = sort(roots(AlE));
disp("Собственные значения:");
disp(eigenvalues)

[eigenvectors, val] = eig(A);

v1 = eigenvectors(:,1);
v2 = eigenvectors(:,2);
v3 = eigenvectors(:,3);

% Нормировка векторов
nv1 = v1 / dot(v1, v1);
nv2 = v2 / dot(v2, v2);
nv3 = v3 / dot(v3, v3);
S = [nv1, nv2, nv3];
disp("Матрица перехода:")
disp(S)

DA = transpose(S)*A*S;
disp("Диагональная матрица:")
disp(DA)

% Каноническая форма
B1 = transpose(S)*B;
v = (eigenvalues(1) * x.^2 + eigenvalues(2) * y.^2 + eigenvalues(3) * z.^2 + B1(1) * x + B1(2) * y + B1(3) * z + a0)/a0;

figure;
isosurface(u, 0);
figure;
isosurface(v, 0);