#*************************** PARÁMETROS DEL PROBLEMA ***************************

domain = linspace(0, 2*pi, 200); %(i1, i2, K)
sun_point = [1, 0, 25];
sun_point2 = [1, 0, 70];
plane_coefficients = [40, 40, 200, 11]; % 40x + 40y + 200z = -11

#*******************************************************************************

curve_points = generate_curve(domain);
shadows = generate_shadows(curve_points, sun_point, plane_coefficients);
shadows2 = generate_shadows(curve_points, sun_point2, plane_coefficients);

plot_scene(curve_points, sun_point, shadows, plane_coefficients, 1);
plot_scene(curve_points,sun_point2, shadows2, plane_coefficients, 2);





