function dxdt = tres_cuerpos_2d(t, x, m1, m2, m3)
%Función que devuelve las ecuaciones de movimiento de tres cuerpos en dos
% dimensiones.

% Parámetros de entrada:
% x: vector columna con las coordenadas y velocidades iniciales del
% sistema:
%       -x(1,2): posición cuerpo 1
%       -x(3,4): velocidad cuerpo 1
%       -x(5,6): posición cuerpo 2
%       -x(7,8): velocidad cuerpo 2
%       -x(9,10): posición cuerpo 3
%       -x(11,12): velocidad cuerpo 3
% m1: masa del cuerpo 1 (kg).
% m2: masa del cuerpo 2 (kg).
% m3: masa del cuerpo 3 (kg).

% Parámetros de salida:
% dxdt: vector columna con las ecuaciones de movimiento, ordenadas de la 
% misma manera que el vector de entrada x. Se llama dxdt para que sepamos
% que son los parametros de los que queremos resolver una EDO, pero
% realmente también depende de la coordenada (dy/dt) y de la velocidad
% (dvx/dt, dvy/dt).

% Constante gravitacional
G = 6.67428e-11;

%Declaramos las posiciones y velocidades por claridad
pos1 = x(1:2);
vel1 = x(3:4);

pos2 = x(5:6);
vel2 = x(7:8);

pos3 = x(9:10);
vel3 = x(11:12);

% Distancia entre los cuerpos
r12 = norm(pos2 - pos1);
r13 = norm(pos3 - pos1);
r23 = norm(pos3 - pos2);

% Ecuaciones de la masa 1
dxdt(1:2) = vel1; %Posición
dxdt(3:4) = G * ((m2 * (pos2 - pos1) / r12^3) + (m3 * (pos3 - pos1) / r13^3)); %Velocidad

% Ecuaciones de la masa 2
dxdt(5:6) = vel2; %Posición
dxdt(7:8) = G * ((m1 * (pos1 - pos2) / r12^3) + (m3 * (pos3 - pos2) / r23^3)); %Velocidad

% Ecuaciones de la masa 3
dxdt(9:10) = vel3; %Posición
dxdt(11:12) = G * ((m1 * (pos1 - pos3) / r13^3) + (m2 * (pos2 - pos3) / r23^3)); %Velocidad

% Convertir el vector fila en un vector columna
dxdt = dxdt';
end

