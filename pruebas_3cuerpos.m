%Resolución del problema de los 3 cuerpos mediante el método Runge-kutta

%Fijamos el salto
dt = 0.01;%(s)
%Fijamos el tiempo final 
t = 25;%(s)

%Fijamos la masa del 1º
m1 =91.0*10^30; %(kg)
%Fijamos la masa del 2º
m2 = 139.8*10^30; %(kg)
%Fijamos la masa del 3º
m3 = 91.7*10^30; %(kg)

%fijamos la función
f = @(t,x) tres_cuerpos_2d(t, x, m1, m2, m3); % función anónima con los valores de m1, m2 y m3 predefinidos

%Fijamos valores iniciales
% Cuerpo 1
x1_0 = -20.0 * 10^6;
y1_0 =  20.0 * 10^6;
vx1_0 = -2.45 * 10^6;
vy1_0 = 0.751 * 10^6;

% Cuerpo 2
x2_0 = 20 * 10^6;
y2_0 = 20 * 10^6;
vx2_0 = 0.087* 10^6;
vy2_0 = -6.898 * 10^6;

% Cuerpo 3
x3_0 = -10 * 10^6;
y3_0 = 13 * 10^6;
vx3_0 = -2.332 * 10^6;
vy3_0 = -21 * 10^6;

%Lo metemos todo en el vector
x = [x1_0; y1_0; vx1_0; vy1_0; x2_0; y2_0; vx2_0; vy2_0; x3_0; y3_0; vx3_0; vy3_0];

%Llamamos al metodo Runge Kutta
a = runge_kutta(f,x,dt,t);
% Esta matriz nos devuelve la siguiente estructura
%       -a(1,2): posición cuerpo 1
%       -a(3,4): velocidad cuerpo 1
%       -a(5,6): posición cuerpo 2
%       -a(7,8): velocidad cuerpo 2
%       -a(9,10): posición cuerpo 3
%       -a(11,12): velocidad cuerpo 3

% Configuración de la animación
fig = figure();
hold on;
axis equal;
grid on;
xlabel('X (m)');
ylabel('Y (m)');
title('Órbita de tres cuerpos');

% Creamos los objetos gráficos para los cuerpos
h1 = plot(a(1,:), a(2,:), 'bo', 'MarkerSize', 3, 'MarkerFaceColor', 'b');
h2 = plot(a(5,:), a(6,:), 'ro', 'MarkerSize', 5, 'MarkerFaceColor', 'r');
h3 = plot(a(9,:), a(10,:), 'go', 'MarkerSize', 3, 'MarkerFaceColor', 'g');

% Agregamos una leyenda
legend([h1, h2, h3], {'Cuerpo 1', 'Cuerpo 2', 'Cuerpo 3'});

% Constante para la suma de los radios de los cuerpos para ver si hay
% colisión
r_suma = 10000; % metro

% Creamos una estructura con los datos de los cuerpos
datos_cuerpos = struct('x1', a(1,:), 'y1', a(2,:), 'x2', a(5,:), 'y2', a(6,:),'x3', a(9,:), 'y3', a(10,:));
    
    % Animación de la órbita
    for i=1:length(a)
    % Actualizamos los datos de los cuerpos
    datos_cuerpos = struct('x1', a(1,i), 'y1', a(2,i), 'x2', a(5,i), 'y2', a(6,i),'x3', a(9,i), 'y3', a(10,i));
    % Actualizamos la posición de los cuerpos en el gráfico
    actualiza_datos(datos_cuerpos, h1, h2, h3);
    
    % Definimos los límites de los ejes x e y con una pequeña separación
    % respecto a los valores de posición de los cuerpos
    xlim([min([a(1,i) a(5,i) a(9,i)])-0.5*10^8 max([a(1,i) a(5,i) a(9,i)])+0.5*10^8]);
    ylim([min([a(2,i) a(6,i) a(10,i)])-0.5*10^8 max([a(2,i) a(6,i) a(10,i)])+0.5*10^8]);

    % Verificar si hay colisión
    dist12 = norm(a(1:2,i) - a(5:6,i));
    dist13 = norm(a(1:2,i) - a(9:10,i));
    dist23 = norm(a(5:6,i) - a(9:10,i));
    
    if dist12 < r_suma || dist13 < r_suma || dist23 < r_suma
        text(0, 0, 'Colisión', 'FontSize', 20, 'Color', 'red', 'HorizontalAlignment', 'center');
        break % Terminar la animación si hay colisión
    end

    pause(0.0000005);
    end
    
% Graficar las posiciones 
figure(2);
plot(a(1,:), a(2,:), 'MarkerSize', 10);
hold on;
plot(a(5,:), a(6,:), 'MarkerSize', 10);
plot(a(9,:), a(10,:), 'MarkerSize', 10);
xlabel('$x$','Interpreter','latex');
ylabel('$y$','Interpreter','latex');
legend('Cuerpo 1', 'Cuerpo 2', 'Cuerpo 3' ,'Interpreter','latex');
title('Posición de los cuerpos en el plano');


% Función para actualizar los datos de los objetos gráficos
function actualiza_datos(datos_cuerpos, h1, h2, h3)
    set(h1, 'XData', datos_cuerpos.x1, 'YData', datos_cuerpos.y1);
    set(h2, 'XData', datos_cuerpos.x2, 'YData', datos_cuerpos.y2);
    set(h3, 'XData', datos_cuerpos.x3, 'YData', datos_cuerpos.y3);
end


