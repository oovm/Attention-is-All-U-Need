(* ::Package:: *)

J3A[j_]:=Block[
	{\[Tau]=(3+Sqrt[-j])/6,\[Eta]},
	\[Eta]=DedekindEta[\[Tau]]/DedekindEta[3\[Tau]];
	(\[Eta]^6+3^3\[Eta]^-6)^2
]
S3A[k_]:=Binomial[2k,k]Binomial[2k,k]Binomial[3k,1k];
S3A[k_]:=(2 k)!(3k)!/(k!)^5;
FilterLevel3[j_]:=Block[
	{\[CapitalDelta]=N[Round@J3A[j]-J3A[j],100]},
	Abs[\[CapitalDelta]]<10^-10
]
RamanujanLevel3[j_]:=Block[
	{x1,x2,l,a,b},
	x1=I Pi Sum[k S3A[k]/Round@J3A[j]^(k+1/2),{k,0,Infinity}];
	x2=I Pi Sum[  S3A[k]/Round@J3A[j]^(k+1/2),{k,0,Infinity}];
	{l,a,b}=FindIntegerNullVector[N[{-1,x1,x2},100]];
	If[l==-1,Return@{j,-a,-b}];
	If[l==1,Return@{j,a,b}];
	Nothing
]
FormatLevel3[{j_,a_,b_}]:=I Inactive[Sum][
	(a k + b) S3A[k]/Round@J3A[j]^(k+1/2),
	{k,0,Infinity}
]


candidates=Quiet@Select[Range[2,267],FilterLevel3]
coefficient=RamanujanLevel3/@candidates
FormatLevel3/@coefficient
