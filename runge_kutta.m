function a = runge_kutta(f,x,dt,t)
%RUNGE_KUTTA Esta funcion resuelve sistemas de EDO
%   -f = vector de funciones planteadas
%   -x = vector con los valores iniciales
%   -dt = longitud del salto
%   -t = tiempo que transcurrirá

%Medidas de las matrices
n = size(x,1); %length(x)
m = t/dt+1;
%Inicializamos la matriz de soluciones
a = zeros(n,m);
a(:,1) = x; %Introducimos los valores iniciales

%Inicializamos el tiempo
ti=0;
% Implementamos el método de Runge Kutta de 4º Orden
for i = 2:m
    k1 = f(ti, a(:,i-1));
    k2 = f(ti+dt/2, a(:,i-1)+(dt/2).*k1);
    k3 = f(ti+dt/2, a(:,i-1)+(dt/2).*k2);
    k4 = f(ti+dt, a(:,i-1)+dt.*k3);
    
    a(:,i) = a(:,i-1) + (dt/6)*(k1 + 2*k2 + 2*k3 + k4);
  
    % Incrementamos el tiempo al final ya que para calcular las k
    % necesitamos el tiempo en el instante anterior
    ti = ti + dt;
end    
end

