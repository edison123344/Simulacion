 S0=[200765 174188 9.323]; I0=[15 20000 1];  %vectores de valores iniciales
  hold on
  for i=1:3
    w0=[S0(i); I0(i); 0]; %vector inicial del sistema
    h=0.01;               %paso
    t0=0; tN=20;          %intervalo de tiempo a estudiar
    N=(tN-t0)/h; 
    t=t0:h:tN; 
    r=0.0000218; a=0.341; %parametros del modelo
   w=zeros(3,N+1); y=zeros(3,N+1);
   w(:,1)=w0; y(:,1)=w0;
   ww=w0; yy=w0; A=[0 0 0; 0 -a 0; 0 a 0]; %matriz del sistema
   for n=1:N
     F=[-r*ww(1)*ww(2); r*ww(1)*ww(2); 0];
     k1=A*yy+F;
     k2=A*(yy+h*k1/2)+F;
     k3=A*(yy+h*k2/2)+F;
     k4=A*(yy+h*k3)+F;
     yy=yy+h/6*(k1+2*k2+2*k3+k4);
     ww=ww+h*(A*ww+F); 
     w(:,n+1)=ww; %vector de calculo con el método de Euler
     y(:,n+1)=yy; %vector de calculo con el método de R-K
   end
   subplot(2,3,i);
   plot(t,w,'Linewidth',4); %graficas calculadas por el método de Euler
   titulo=sprintf('Euler S0=%d, I0=%d', S0(i), I0(i));
   legend('S(t)','I(t)', 'R(t)');
   title(titulo);
   xlabel('Tiempo t (en semanas)');
   subplot(2,3,i+3);
     plot(t,w,'Linewidth',4); %graficas calculadas por el método de R-K
   titulo=sprintf('R-K S0=%d, I0=%d', S0(i), I0(i));
   legend('S(t)','I(t)', 'R(t)');
   title(titulo);
   xlabel('Tiempo t (en semanas)');
 end