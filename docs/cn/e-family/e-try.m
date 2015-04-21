(* ::Package:: *)

tryE[n_,power_,solvers_]:=Flatten[
{
try1[n,power,solvers],
try2[n,power,solvers],
try3[n,power,solvers],
try4[n,power,solvers],
try5[n,power,solvers],
try6[n,power,solvers]
}
]


try1[n_,power_,solvers_]:=Block[
    {a,k,e,x,delta,out},
    e=(x+a)^2 *E^x/k;
    delta = If[n>E^power,n-E^power,E^power-n];
    out=Integrate[e,{x,0,power}]-delta;
    out=CoefficientList[out,E^power];
    out=FindInstance[
    {out==0},
    {a,k},
    Integers,
    solvers
    ];
    If[!ListQ@out,Return@{}];
    If[Length[out]==0,Return@{} ];
    {e, delta}/.out
];
try2[n_,power_,solvers_]:=Block[
    {a,b,k,e,x,delta,out},
    e=(x^2+a x + b)^2 *E^x/k;
    delta = If[n>E^power,n-E^power,E^power-n];
    out=Integrate[e,{x,0,power}]-delta;
    out=CoefficientList[out,E^power];
    out=FindInstance[
    {out==0},
    {a,b,k},
    Integers,
    solvers
    ];
    If[!ListQ@out,Return@{}];
    If[Length[out]==0,Return@{} ];
    {e, delta}/.out
];
try3[n_,power_,solvers_]:=Block[
    {a,b,c,k,e,x,delta,out},
    e=(x^3+a x^2 + b x + c)^2 *E^x/k;
    delta = If[n>E^power,n-E^power,E^power-n];
    out=Integrate[e,{x,0,power}]-delta;
    out=CoefficientList[out,E^power];
    out=FindInstance[
    {out==0},
    {a,b,c,k},
    Integers,
    solvers
    ];
    If[!ListQ@out,Return@{}];
    If[Length[out]==0,Return@{} ];
    {e, delta}/.out
];
try4[n_,power_,solvers_]:=Block[
    {a,b,c,d,k,e,x,delta,out},
    e=(x^4+a x^3 + b x^2 + c x + d)^2 *E^x/k;
    delta = If[n>E^power,n-E^power,E^power-n];
    out=Integrate[e,{x,0,power}]-delta;
    out=CoefficientList[out,E^power];
    out=FindInstance[
    {out==0},
    {a,b,c,d,k},
    Integers,
    solvers
    ];
    If[!ListQ@out,Return@{}];
    If[Length[out]==0,Return@{} ];
    {e, delta}/.out
];


try5[n_, power_,solvers_] := Block[
	{a, b, e, x, delta, out},
        e = (a x + b) * E^x;
        delta =If[n > E^power, n - E^power,E^power - n ];
        out = Integrate[e, {x, 0, power}] - delta;
        out = CoefficientList[out, E^power];
        out = FindInstance[{
        out == 0, a != 0, 
        b >= 0, a * power + b >= 
            0
            }, 
            {a, b},
             Rationals, 
             solvers
             ];
        If[!ListQ @ out,
            Return @ {}
        ];
        If[Length[out] == 0,
            Return @ {}
        ];
        {e, delta} /. out
    ];
try6[n_, power_,solvers_] := Block[
	{a, b,c, e, x, delta, out},
        e = (a x^2 + b x + c) * E^x;
        delta =If[n > E^power, n - E^power,E^power - n ];
        out = Integrate[e, {x, 0, power}] - delta;
        out = CoefficientList[out, E^power];
        out = FindInstance[
        {
        out == 0,  a != 0, 
        c >= 0, 
        a * power^2 + b* power+c >=  0
            }, 
            {a, b,c}, 
            Rationals, 
            solvers
            ];
        If[!ListQ @ out,
            Return @ {}
        ];
        If[Length[out] == 0,
            Return @ {}
        ];
        {e, delta} /. out
    ];
try7[n_, power_,solvers_] := Block[
	{a, b,c,d, e, x, delta, out},
        e = (a x^3 + b x^2 + c x + d) * E^x;
        delta =If[n > E^power, n - E^power,E^power - n ];
        out = Integrate[e, {x, 0, power}] - delta;
        out = CoefficientList[out, E^power];
        out = FindInstance[
        {
        out == 0,  a != 0, 
        d >= 0, 
        a * power^3 + b* power^2+c* power + d >=  0
            }, 
            {a, b,c}, 
            Rationals, 
            solvers
            ];
        If[!ListQ @ out,
            Return @ {}
        ];
        If[Length[out] == 0,
            Return @ {}
        ];
        {e, delta} /. out
    ];
    
    
