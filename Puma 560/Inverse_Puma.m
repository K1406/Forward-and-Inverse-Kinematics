clc;
theta1=0;
theta2=0;
theta3=0;
theta4=0;
theta5=0;
theta6=0;
T60_Puma=forwardP(theta1,theta2,theta3,theta4,theta5,theta6);
X=T60_Puma(1,4);
Y=T60_Puma(2,4);
Z=T60_Puma(3,4);
Xt=-15.7206;
Yt=-10.2938;
Zt=-59.2486;
alpha=1.5;
Q=[theta1;theta2;theta3;theta4;theta5;theta6];
a=0;
i = 0;
while a==0 && i < 1500
e=[Xt-X;Yt-Y;Zt-Z];
J =Puma_560(theta1,theta2,theta3,theta4,theta5);
del_Q=pinv(J)*alpha*e;
Q=Q+del_Q;
T60_Puma=forwardP(Q(1,1),Q(2,1),Q(3,1),Q(4,1),Q(5,1),Q(6,1));
X=T60_Puma(1,4);
Y=T60_Puma(2,4);
Z=T60_Puma(3,4);
plot3(Xt,Yt,Zt,'b--o');hold on;
d=sqrt((Xt-X)^2+(Yt-Y)^2+(Zt-Z)^2)
pause(.001)
if(d<1)
    a=1;
end
i=i+1;
end