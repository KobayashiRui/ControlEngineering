clear
A = [0 1 ; -5 -6];
B = [0 ; 1];
C = [1 0];

Q = [500 0 ; 0 1];
R = [10];

x0 = [1 ; 0];
t = linspace(0,10,100);

//フィードバックゲインを求める
P=syslin('c',A,B,C); 
[K,X]=lqr(P,Q,R);

A2 = A + B*K;
//入力・出力・状態遷移行列を求める
i = 0;
for n=t
    x = expm(A2*n)*x0;
    i = i+1;
    T(i,1) = n;
    X1(i) = x(1);
    X2(i) = x(2); 
    U(i) = -K*x
end

//グラフの描画
clf();
scf(0);
plot2d(T,[X1, X2], style=[5,2]);
xgrid();
legend("X1", "X2", 1);
xtitle("", "t", "x(t)");

scf(1);
plot2d(T,U, style=color(255, 0, 200));
xgrid();
legend("u(t)" ,1);
xtitle("", "t", "u(t)");

xs2png(0, "./0")
xs2png(1, "./1")
//グラフの保存
//xs2png(0, "/Users/takayamahiroki/scilab/graph/AD5/q11000r1/AD5_xt");
//xs2png(1, "/Users/takayamahiroki/scilab/graph/AD5/q11000r1/AD_ut");
//xs2png(2, "/Users/takayamahiroki/scilab/graph/AD5/q11000r1/AD5_yt");

disp(K);
