function shadows = generate_shadows(curve_points, sun_point, plane_coefficients)
  [n_rows, n_columns] = size(curve_points);
  shadows = zeros(n_rows, n_columns);

  s = sun_point;
  p = curve_points;
  d = plane_coefficients;

  for i = 1:n_rows
    A=[s(1,2)-p(i,2), -(s(1,1))+p(i,1), 0;
      0, s(1,3)-p(i,3), -(s(1,2))+p(i,2);
      d(1,1), d(1,2), d(1,3)];

    b=[(s(1,1)*(s(1,2)-p(i,2)))-(s(1,2)*(s(1,1)-p(i,1)));
      (s(1,2)*(s(1,3)-p(i,3)))-(s(1,3)*(s(1,2)-p(i,2)));
      d(1,4)];

    [L,U,P,Q] = FactorLU_PM(A);

    [C] = lower_triangular_solver(L,P*b);

    [Z] = upper_triangular_solver(U,C);

    shadow = Q*Z;

    shadows(i,1) = shadow(1,1);
    shadows(i,2) = shadow(2,1);
    shadows(i,3) = shadow(3,1);
  endfor
endfunction



