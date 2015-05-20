(* ::Package:: *)

J2A[j_]:=Block[
	{\[Tau]=Sqrt[-j]/2,\[Eta]},
	\[Eta]=DedekindEta[\[Tau]]/DedekindEta[2\[Tau]];
	(\[Eta]^12+2^6\[Eta]^-12)^2
]
S2A[k_]:=Binomial[2k,k]Binomial[2k,k]Binomial[4k,2k]
FilterLevel2[j_]:=Block[
	{\[CapitalDelta]=N[Round@J2A[j]-J2A[j],100]},
	Abs[\[CapitalDelta]]<10^-10
]
RamanujanLevel2[j_]:=Block[
	{x1,x2,l,a,b},
	x1=Sqrt[2]Pi Sum[k S2A[k]/J2A[j]^(k+1/2),{k,0,Infinity}];
	x2=Sqrt[2]Pi Sum[ S2A[k]/J2A[j]^(k+1/2),{k,0,Infinity}];
	{l,a,b}=FindIntegerNullVector[N[{-1,x1,x2},100]];
	If[l==-1,Return@{j,-a,-b}];
	If[l==1,Return@{j,a,b}];
	Nothing
]
FormatLevel2[{j_,a_,b_}]:=Sqrt[2]Inactive[Sum][
	(a k + b) S2A[k]/Round@J2A[j]^(k+1/2),
	{k,0,Infinity}
]


candidates=Quiet@Select[Range[2,1000],FilterLevel2]
coefficient=RamanujanLevel2/@candidates//FullSimplify
FormatLevel2/@coefficient



