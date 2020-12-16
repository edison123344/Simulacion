 y0=[9700 10200 30000];
 h=0.01; c=0.92; N=500000; M=10000;
 t=0:h:15;
 k1=0; k2=0; k3=0; k4=0;
 y=[]; Y=zeros(3,length(t));
 for k=1:3
    yy=y0(k);
    y=[y0(k)];
   for i=1:length(t)
     k1=c/N*yy*(N-yy)*(yy/M-1);
     k2=c/N*(yy+h*k1/2)*(N-yy-h*k1/2)*((yy+h*k1/2)/M-1);
     k3=c/N*(yy+h*k2/2)*(N-yy-h*k2/2)*((yy+h*k2/2)/M-1);
     k4=c/N*(yy+h*k3)*(N-yy-h*k3)*((yy+h*k3)/M-1);
     yy=yy+h/6*(k1+2*k2+2*k3+k4);
     y=[y yy];
   end
   y(end)=[];
   Y(k,:)=y;
 end
 hold on
 subplot(2,2,1)
 plot(t,Y(1,:));
 title('Estudio con I(0)=9700');
 xlabel('Tiempo (en semanas)');
 ylabel('Numero de infectados');
 subplot(2,2,2)
 plot(t,Y(2,:));
 title('Estudio con I(0)=10200');
 xlabel('Tiempo (en semanas)');
 ylabel('Numero de infectados');
 subplot(2,2,3)
 plot(t,Y(3,:));
 title('Estudio con I(0)=30000');
 xlabel('Tiempo (en semanas)');
 ylabel('Numero de infectados');
 hold off