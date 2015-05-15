(* ::Package:: *)

S1A[k_]:=Binomial[2k,k]Binomial[3k,k]Binomial[6k,3k]
J1A[n_]:=With[
{\[Tau]=(1+I Sqrt[n])/2},
12^3KleinInvariantJ[\[Tau]]
];
FilterLevel1[j_]:=Block[
{\[CapitalDelta]=N[Round@J1A[j]-J1A[j],100]},
If[Abs[\[CapitalDelta]<10^-10],True,False]
]
