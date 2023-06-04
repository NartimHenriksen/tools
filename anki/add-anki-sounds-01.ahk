#Requires AutoHotkey v2.0															

brakes := 100 ;needed for the thing to work

;SetKeyDelay(1000)
;Meant to replace breaks but doesn't seem to do anything
waitforcontextmenu := 100
waitforwindow := 200
tabsleep:= 140

^r::Reload


tab(tabs) {
	loop tabs {
		Send '`t'
		Sleep tabsleep
	}
}

; tab back to note browser and step down
gonext(tabs)
{
	Send '{LShift down}'
	Sleep brakes
	tab(tabs)
	Sleep brakes
	Send '{LShift up}'
	Sleep brakes
	Send '{Down}'
}	
;arg is length of word
; from note browser, select the current notes traditional mandarin and search it with addon
search(chars)
{
tab(4)
Sleep brakes

Send '{Home}'
Sleep brakes
Send '{Right}'
Sleep brakes
loop chars {
	Send '{Right}'
	Sleep brakes
}
Send '{LShift down}'
Sleep brakes
loop chars {
	Send '{Right}'
	Sleep brakes
}
Send '{LShift up}'
Sleep brakes
quicksearch()
}
;Search currently selected word
^h::{
	quicksearch()
}
quicksearch(){
	Send '{AppsKey}'
	Sleep waitforcontextmenu
	Send '{Up}'
	Sleep brakes
	Send '{Enter}'
	Sleep waitforwindow
	Send '{Enter}'
}
;
^u::{
    search(1)
}
;
^i::{
    search(2)
}
;
^o::{
    search(3)
}
;
^p::{
    search(4)
}
;
^2::{
    search(2)
}
;

;confirm searched audio and go next
^k::{
Send '{LShift down}`t{LShift up}{Enter}'
Sleep brakes
gonext(6)
}

;cancel audio search and go next
^l::{
Send '{Escape}'
Sleep brakes
gonext(4)
}

^n::{
	Send '{Down}'
}
^m::{
	Send '{Up}'
}
