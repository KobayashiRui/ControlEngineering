A = [0 1 ; -5 -6];
B = [0 ; 1];
C = [1 0];

Q = [1000 0 ; 0 1];
R = 1;

x0 = [1 ; 0];
t = linspace(0,10,100);

//フィードバックゲインを求める
Big=blockdiag(Q,R);
[w,wp]=fullrf(Big);
C1=wp(:,1:2);
D12=wp(:,3:$);
P=syslin('c',A,B,C1,D12); 
[K,X]=lqr(P);
disp(K);

A2 = A + B*K;
//disp(A2);
//
i = 0;
for n=t
    x = expm(A2*n)*x0;
    i = i+1;
    T(i,1) = n;
    X(i,1) = x(1);
    X(i,2) = x(2); 
end

clf();
plot2d(T,X);
