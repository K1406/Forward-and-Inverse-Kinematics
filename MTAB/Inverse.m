clc;
theta1=0;
theta2=0;
theta3=0;
theta4=0;
theta5=0;
theta6=0;
T60=forward(theta1,theta2,theta3,theta4,theta5,theta6);
X=T60(1,4);
Y=T60(2,4);
Z=T60(3,4);
Xt=-17.9398;
Yt=37.2247;
Zt=0;
alpha=1.5;
Q=[theta1;theta2;theta3;theta4;theta5;theta6];
a=0;
i = 0;
while a==0 && i < 1500
e=[Xt-X;Yt-Y;Zt-Z];
J = MTAB_Aristo_Jacobian(theta1,theta2,theta3,theta4,theta5,theta6);
del_Q=pinv(J)*alpha*e;
Q=Q+del_Q;
T60=forward(Q(1,1),Q(2,1),Q(3,1),Q(4,1),Q(5,1),Q(6,1));
X=T60(1,4);
Y=T60(2,4);
Z=T60(3,4);
plot3(Xt,Yt,Zt,'b--o');hold on;
d=sqrt((Xt-X)^2+(Yt-Y)^2+(Zt-Z)^2)
pause(.001)
if(d<.05)
    a=1;
end
i=i+1;
end
 

 
