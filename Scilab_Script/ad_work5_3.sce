A = [0 1 ; -5 -6];
B = [0 ; 1];
C = [1 0];

Q = [1 0 ; 0 1];
R = [10];

x0 = [1 ; 0];
t = linspace(0,10,100);

//フィードバックゲインを求める
P=syslin('c',A,B,C); 
[K,X]=lqr(P,Q,R);

A2 = A + B*K;
disp(A2);
B2 = [0;0];
C2 = [1 0];
//入力・出力・状態遷移行列を求める
P2 = syslin('c',A2,B2,C2);
deff('[u]=output(t)','u = 0');
u_list = zeros(1,100)  
[y,x] = csim(u_list,t,P2,x0);
X1 = x(1,:)
X2 = x(2,:)
//グラフの描画
clf();
scf(0);
plot(t,x(1,:),t,x(2,:));
xgrid();
//legend("X1", "X2", 1);
//xtitle("optimal regulator condition", "t", "x(t)");
//
scf(1);
plot2d(t,y, style=color(255, 0, 200));
xgrid();
//legend("u(t)" ,1);
//xtitle("optimal regulator input", "t", "u(t)");
//
//scf(2);
//plot2d(T,Y, style=4);
//xgrid();
//legend("y(t)" ,1);
//xtitle("optimal regulator output", "t", "y(t)");

//グラフの保存
//xs2png(0, "/Users/takayamahiroki/scilab/graph/AD5/q11000r1/AD5_xt");
//xs2png(1, "/Users/takayamahiroki/scilab/graph/AD5/q11000r1/AD_ut");
//xs2png(2, "/Users/takayamahiroki/scilab/graph/AD5/q11000r1/AD5_yt");

disp(K);
