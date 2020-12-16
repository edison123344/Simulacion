data = dlmread('ecuacovidDep.csv');
x = data(:,2);
y = data(:,3);
% Crea una función para trazar los datos
function plotData(x,y)
plot(x,y,'rx','MarkerSize',8); % Trazar los datos
end
% Traza los datos
plotData(x,y);
xlabel('Dias');% Establecer la etiqueta del eje x
ylabel('Infectados'); % Establecer la etiqueta del eje y
%fprintf('Programa pausado. Presione enter para continuar.\n');
%pause;
% Cuenta cuántos puntos de datos tenemos
m = length(x);
% Sumar una columna de todos unos (término de intersección) ax
X = [ones(m, 1) x];

% Calcula theta
theta = (pinv(X'*X))*X'*y

% Grafique la ecuación ajustada que obtuvimos de la regresión
hold on; % esto mantiene visible nuestro gráfico anterior de los datos de entrenamiento.
plot(X(:,2), X*theta, '-')
legend('Datos Infectados', 'Linea de regresion')
hold off % Quita la posivilidad de poner mas graficos
