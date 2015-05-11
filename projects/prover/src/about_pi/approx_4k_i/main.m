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
