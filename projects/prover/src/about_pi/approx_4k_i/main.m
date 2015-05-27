(* ::Package:: *)

(* ::Section:: *)
(*Find All Stage*)


filterMixed[params_List] := Block[
  {symbols, expr, syms},
  (symbols = {Log, Pi, EulerGamma};
     expr = ExpandAll@Sum[1/Product[(4 k + i), {i, params}], {k, 0, Infinity}];
     If[! FreeQ[expr, PolyGamma], Return@Nothing];);
    syms = Sum[Boole@FreeQ[expr, term], {term, symbols}];
  If[syms < 2, Return@Nothing];
  params -> expr
  ]


SetDirectory@NotebookDirectory[];
params=Select[Subsets[Range@20,{2,20}],Min[#]<5&];
Length[params]
data=ParallelMap[filterMixed,params];
Length[data]
Export["4k+1.m",data]


(* ::Input:: *)
(*patterns = Import["4k+1.json", "RawJSON"]*)
(*exprs = Flatten[Table[*)
(*            Inactive[Sum][1/Product[4 k + i, {i, #}], {k, j, Infinity}],*)
(*            {j, 0, 5}*)
(*            ] & /@ patterns];*)
(*searches = Denominator /@ Convergents@ContinuedFraction[Pi, 20];*)
(*shift4[expr_] := Block[*)
(*    	{coeff, normed, denom},*)
(*    	coeff = CoefficientList[Activate@expr, Pi];*)
(*    	normed = Denominator@Last@coeff;*)
(*    	denom = Denominator@First[normed*coeff];*)
(*    	If[MemberQ[searches, denom], normed*expr, Nothing]*)
(*    ]*)
(*Collect[outs // Activate, Pi]*)


(* ::Input:: *)
(*formatLog[pattern_->result_]:=Block[*)
(*{a,b,c},*)
(*{b,a}=CoefficientList[result,Log[2]];*)
(*{c,a}=NumeratorDenominator[a];*)
(*Which[*)
(*(*a != 0*)*)
(*c<0,*)
(*{*)
(*-a*b/c-Log[2],*)
(*-1/c Inactive[Sum][a Product[1/(4k+i),{i,pattern}],{k,0,Infinity}]*)
(*},*)
(*c>0,*)
(*{*)
(*a*b/c+Log[2],*)
(*1/c Inactive[Sum][a Product[1/(4k+i),{i,pattern}],{k,0,Infinity}]*)
(*}*)
(*]*)
(*]*)
(*data=Import["4k+1.m"];*)
(*data=Select[data,!FreeQ[Last@#,Log]&]/.{*)
(*Log[4]->2Log[2],*)
(*Log[8]->3Log[2],*)
(*Log[16]->4Log[2],*)
(*Log[32]->Log2[32]Log[2],*)
(*Log[64]->Log2[64]Log[2],*)
(*Log[256]->Log2[256]Log[2],*)
(*Log[8192]->Log2[8192]Log[2]*)
(*}*)
(*(*Select[formatLog/@data,FullSimplify[Activate@Last[#]-First[#]]!=0&]*)*)
(*SortBy[formatLog/@data,First]*)
