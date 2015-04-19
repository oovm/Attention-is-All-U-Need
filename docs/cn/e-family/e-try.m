(* ::Package:: *)

try1[n_,power_]:=Block[
{a,k,e,x,delta,out},
e=(x+a)^2 *E^x/k;
delta = If[n>E^power,n-E^power,E^power-n];
out=Integrate[e,{x,0,power}]-delta;
out=CoefficientList[out,E^power];
out=FindInstance[
{out==0},
{a,k},
Integers,
10
];
If[!ListQ@out,Return@{}];
If[Length[out]==0,Return@{} ];
{e, delta}/.out
];
try2[n_,power_]:=Block[
{a,b,k,e,x,delta,out},
e=(x^2+a x + b)^2 *E^x/k;
delta = If[n>E^power,n-E^power,E^power-n];
out=Integrate[e,{x,0,power}]-delta;
out=CoefficientList[out,E^power];
out=FindInstance[
{out==0},
{a,b,k},
Integers,
10
];
If[!ListQ@out,Return@{}];
If[Length[out]==0,Return@{} ];
{e, delta}/.out
];
try3[n_,power_]:=Block[
{a,b,c,k,e,x,delta,out},
e=(x^3+a x^2 + b x + c)^2 *E^x/k;
delta = If[n>E^power,n-E^power,E^power-n];
out=Integrate[e,{x,0,power}]-delta;
out=CoefficientList[out,E^power];
out=FindInstance[
{out==0},
{a,b,c,k},
Integers,
10
];
If[!ListQ@out,Return@{}];
If[Length[out]==0,Return@{} ];
{e, delta}/.out
];
try4[n_,power_]:=Block[
{a,b,c,d,k,e,x,delta,out},
e=(x^4+a x^3 + b x^2 + c x + d)^2 *E^x/k;
delta = If[n>E^power,n-E^power,E^power-n];
out=Integrate[e,{x,0,power}]-delta;
out=CoefficientList[out,E^power];
out=FindInstance[
{out==0},
{a,b,c,d,k},
Integers,
10
];
If[!ListQ@out,Return@{}];
If[Length[out]==0,Return@{} ];
{e, delta}/.out
];

