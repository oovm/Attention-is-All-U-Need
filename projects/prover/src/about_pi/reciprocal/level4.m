(* ::Package:: *)

J4A[j_]:=Block[
	{\[Tau]=(1+Sqrt[-j])/2,\[Eta]},
	\[Eta]=DedekindEta[\[Tau]]/DedekindEta[4\[Tau]];
	(\[Eta]^4+4^2\[Eta]^-4)^2
]
S4A[k_]:=Binomial[2k,k]^3;
S4A[k_]:=((2k)!/k!^2)^3;
FilterLevel4[j_]:=Block[
	{\[CapitalDelta]=N[Round@J4A[j]-J4A[j],100]},
	Abs[\[CapitalDelta]]<10^-10
]
RamanujanLevel4[j_]:=Block[
	{x1,x2,l,a,b},
	x1=I Pi Sum[k S4A[k]/Round@J4A[j]^(k+1/2),{k,0,Infinity}];
	x2=I Pi Sum[  S4A[k]/Round@J4A[j]^(k+1/2),{k,0,Infinity}];
	{l,a,b}=FindIntegerNullVector[N[{-1,x1,x2},100]];
	If[l==-1,Return@{j,-a,-b}];
	If[l==1,Return@{j,a,b}];
	Nothing
]
FormatLevel4[{j_,a_,b_}]:=I Inactive[Sum][
	(a k + b) S4A[k]/Round@J4A[j]^(k+1/2),
	{k,0,Infinity}
]


candidates=Quiet@Select[Range[2,163],FilterLevel4]
coefficient=RamanujanLevel4/@candidates
FormatLevel4/@coefficient



