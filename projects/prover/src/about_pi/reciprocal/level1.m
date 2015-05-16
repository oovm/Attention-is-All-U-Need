(* ::Package:: *)

S1A[k_]:=Binomial[2k,k]Binomial[3k,k]Binomial[6k,3k]
J1A[n_]:=With[
	{\[Tau]=(1+I Sqrt[n])/2},
	12^3KleinInvariantJ[\[Tau]]
];
FilterLevel1[j_]:=Block[
	{\[CapitalDelta]=N[Round@J1A[j]-J1A[j],100]},
	Abs[\[CapitalDelta]]<10^-10
]
RamanujanLevel1[j_]:=Block[
	{x1,x2,l,a,b},
	x1=Pi Im@Sum[k S1A[k]/J1A[j]^(k+1/2),{k,0,Infinity}];
	x2=Pi Im@Sum[ S1A[k]/J1A[j]^(k+1/2),{k,0,Infinity}];
	{l,a,b}=FindIntegerNullVector[N[{-1,x1,x2},100]];
	If[l==-1,Return@{j,-a,-b}];
	If[l==1,Return@{j,a,b}];
	Nothing
];
FormatLevel1[{j_,a_,b_}]:=Inactive[Sum][
	I^3(a k + b) S1A[k]/J1A[j]^(k+1/2),
	{k,0,Infinity}
]


candidates=Quiet@Select[Range[2,1000],FilterLevel1]
coefficient=RamanujanLevel1/@candidates//FullSimplify
FormatLevel1/@coefficient



