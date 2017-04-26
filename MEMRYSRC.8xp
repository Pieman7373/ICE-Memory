[i]MEMORY
Begin 
CompilePrgm(MEMSPRTS
For(A,1,36
	1+remainder(rand,A->B
	L1(B->L1(A
	A->L1(B
End
Lbl DRAWCARDGRID
50->C->X
15->D->Y
1->F->H
0->L->N->P
FillScreen(24
For(36
	//Make the grid resizeable(maybe, in the future)
	SetColor(7
	FillRectangle_NoClip(C,D,30,30
	SetColor(240
	Rectangle_NoClip(C,D,30,30
	C+35->C
	If C>225
		50->C
		D+35->D
	End
End
X->C
Y->D
Lbl DRAWCURSOR
If F=0
	SetColor(2,24
	Rectangle_NoClip(A-2,B-2,34,34
	Rectangle_NoClip(A-1,B-1,32,32
End
If P=18
	Goto YOUWON
End
0->F
SetColor(0
Rectangle_NoClip(X-2,Y-2,34,34
Rectangle_NoClip(X-1,Y-1,32,32
X->A
Y->B
Lbl CGETKEY
getKey->K
If K=2
	X-35->X
End
If K=4
	Y-35->Y
End
If K=3
	X+35->X
End
If K=1
	Y+35->Y
End
If K=15
	det(1
	Return
End
If K=54 or K=9
	Goto GETSPRITE
End
If K
	If X<50
		225->X
	End
	If X>225
		50->X
	End
	If Y+35=15
		190->Y
	End
	If Y>190
		15->Y
	End
	Goto DRAWCURSOR
End
Goto CGETKEY
Lbl GETSPRITE
If N=1 and X=C and Y=D
	0->N
	SetColor(7
	FillRectangle_NoClip(X,Y,30,30
	SetColor(240
	Rectangle_NoClip(X,Y,30,30
	Goto DRAWCURSOR
End
If N=2 and X=C and Y=D
	Goto DRAWCURSOR
End
If Y=15
	If X=50
		1->L
	End
	If X=85
		2->L
	End
	If X=120
		3-L
	End
	If X=155
		4->L
	End
	If X=190
		5->L
	End
	If X=225
		6->L
	End
End
If Y=50
	If X=50
		7->L
	End
	If X=85
		8->L
	End
	If X=120
		9-L
	End
	If X=155
		10->L
	End
	If X=190
		11->L
	End
	If X=225
		12->L
	End
End
If Y=85
	If X=50
		13->L
	End
	If X=85
		14->L
	End
	If X=120
		15-L
	End
	If X=155
		16->L
	End
	If X=190
		17->L
	End
	If X=225
		18->L
	End
End
If Y=120
	If X=50
		19->L
	End
	If X=85
		20->L
	End
	If X=120
		21-L
	End
	If X=155
		22->L
	End
	If X=190
		23->L
	End
	If X=225
		24->L
	End
End
If Y=155
	If X=50
		25->L
	End
	If X=85
		26->L
	End
	If X=120
		27-L
	End
	If X=155
		28->L
	End
	If X=190
		29->L
	End
	If X=225
		30->L
	End
End
If Y=190
	If X=50
		31->L
	End
	If X=85
		32->L
	End
	If X=120
		33-L
	End
	If X=155
		34->L
	End
	If X=190
		35->L
	End
	If X=225
		36->L
	End
End
L1(L)->S
If S>18
	S-18->S
End
If S=0
	SetColor(24
	FillRectangle_NoClip(0,0,40,40
	Goto DRAWCURSOR
End
If N=0
	L->Q
	S->T
	X->C
	Y->D
End
N+1->N
SetColor(24
FillRectangle(0,0,40,40
ScaledSprite_NoClip(S-1,X,Y,6,6
If N=2
	0->N
	Goto FLIP
End
Goto DRAWCURSOR
Lbl FLIP
Pause 600
If T!=S
	SetColor(7
	FillRectangle_NoClip(X,Y,30,30
	FillRectangle_NoClip(C,D,30,30
	SetColor(240
	Rectangle_NoClip(X,Y,30,30
	Rectangle_NoClip(C,D,30,30
End
If T=S
	SetColor(24
	FillRectangle_NoClip(X,Y,30,30
	FillRectangle_NoClip(C,D,30,30
	0->L1(L)
	0->L1(Q)
	P+1->P
End
Goto DRAWCURSOR
Lbl YOUWON
FillScreen(24
SetTextFGColor(231
SetTextScale(2,2
PrintStringXY(2,2,"YOU WON
Pause 
det(1
Return
