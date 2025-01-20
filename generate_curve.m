function H = generate_curve(domain)
  x = [];
  y = [];
  z = [];

  for t = domain
    x = [x 0];
    y = [y 2*5*(1-cos(t))*sin(t)];
    z = [z 2*5*(1-cos(t))*cos(t)+20];
  endfor
  H = [x; y; z]';
endfunction



