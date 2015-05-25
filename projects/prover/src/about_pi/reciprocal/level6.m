(* ::Package:: *)

J5A[j_]:=Block[
	{\[Tau]=(5+Sqrt[-5j])/10,\[Eta]},
	\[Eta]=DedekindEta[\[Tau]]/DedekindEta[5\[Tau]];
	\[Eta]^6+5^3\[Eta]^-6+22
]
S6A[k_]:=Binomial[2k,k]Sum[Binomial[k,j]^3,{j,0,k}];
S6B[k_]:=Binomial[2k,k]Sum[Binomial[k,j]^2Binomial[2j,j],{j,0,k}];
S6C[k_]:=Binomial[2k,k]Sum[Binomial[k,j]^3,{j,0,k}];
FilterLevel5[j_]:=Block[
	{\[CapitalDelta]=N[Round@J5A[j]-J5A[j],100]},
	Abs[\[CapitalDelta]]<10^-10
]
RamanujanLevel5[j_]:=Block[
	{x1,x2,l,a,b},
	x1=I Pi Sum[k S5A[k]/Round@J5A[j]^(k+1/2),{k,0,Infinity}];
	x2=I Pi Sum[  S5A[k]/Round@J5A[j]^(k+1/2),{k,0,Infinity}];
	{l,a,b}=FindIntegerNullVector[N[{-1,x1,x2},100]];
	If[l==-1,Return@{j,-a,-b}];
	If[l==1,Return@{j,a,b}];
	Nothing
]
FormatLevel5[{j_,a_,b_}]:=I Inactive[Sum][
	(a k + b) S5A[k]/Round@J5A[j]^(k+1/2),
	{k,0,Infinity}
]


candidates=Quiet@Select[Range[2,815],FilterLevel5]
coefficient=RamanujanLevel5/@candidates
FormatLevel5/@coefficient

