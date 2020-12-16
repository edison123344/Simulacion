data = dlmread('ecuacovidDep.csv');
x = data(:,2);
y = data(:,3);
p=polyfit(x,y,2)
hold on
plot(x,y,'ro','markersize',8,'markerfacecolor','r')
x=linspace(min(x),max(x) ,50);
y=polyval(p,x);
plot(x,y,'b')
xlabel('x')
ylabel('y')
title('Polinomio  aproximador')
hold  off