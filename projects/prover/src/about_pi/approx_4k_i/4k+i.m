(* ::Package:: *)

filter4[range_List]:=Block[
    {out,count,coeff},
    out=Sum[1/Product[(4k+i),{i,range}],{k,0,Infinity}];
    count=Count[out,_Log,Infinity];
    If[count>=1,Return@Nothing];
    coeff=CoefficientList[out,\[Pi]];
    If[Length@coeff!=2,Return@Nothing];
    If[Numerator@Abs@Last@coeff!=1,Return@Nothing];
    range->Collect[out,\[Pi]]
    ];
format4[pattern_List]:=Block[
    {sum,coeff,denom,frac,delta},
    sum=Inactive[Sum][1/Product[(4k+i),{i,pattern}],{k,0,Infinity}];
    coeff=CoefficientList[sum//Activate,Pi];
    denom=Denominator@Last@coeff;
    frac=First[coeff*denom];
    delta=N[Abs@If[frac<0,frac+Pi,frac-Pi],20];
    Association[
        "coefficients"->pattern,
        "magnification"->denom,
(*      "positive"->Positive@frac,*)
        "numerator"->Numerator@frac,
        "denominator"->Denominator@frac,
        "delta"->delta
    ]
];


SetDirectory@NotebookDirectory[];
condition[list_] := Min[list] <= 4;
sets=Select[Subsets[Range[1,20],{2,20}],condition];
patterns=ParallelMap[filter4,sets];
data=format4/@(First/@patterns);
Export["4k+1.json",data,"RawJSON"]



patterns=Import["4k+1.json","RawJSON"]
exprs=Flatten[Table[
Inactive[Sum][1/Product[4k+i,{i,#}],{k,j,Infinity}],
{j,0,5}
]&/@patterns];
searches=Denominator/@Convergents@ContinuedFraction[Pi,20];
shift4[expr_]:=Block[
	{coeff,normed,denom},
	coeff=CoefficientList[Activate@expr,Pi];
	normed=Denominator@Last@coeff;
	denom=Denominator@First[normed*coeff];
	If[MemberQ[searches,denom],normed*expr,Nothing]
]
Collect[outs//Activate,Pi]
