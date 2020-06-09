;Get method for testing http://127.0.0.1/logo
#Persistent
#SingleInstance, force ; mutex
SetBatchLines, -1 ; Maximal execution speed, no CPU optimzation
SetTitleMatchMode, 2 ; Partial title matching

paths := {}
paths["/"] := Func("Default")
paths["404"] := Func("NotFound")
paths["/logo"] := Func("Logo")

;Custom Network Events List
paths["/ok"] := Func("OK")
paths["/up"] := Func("UP")
paths["/down"] := Func("DOWN")
paths["/left"] := Func("LEFT")
paths["/right"] := Func("RIGHT")
paths["/3"] := Func("3")
paths["/1"] := Func("1")
paths["/2"] := Func("2")
paths["/red"] := Func("RED")
paths["/7"] := Func("7")
paths["/9"] := Func("9")
paths["/green"] := Func("GREEN")
paths["/mute"] := Func("MUTE")
paths["/power"] := Func("POWER")
paths["/4"] := Func("4")
paths["/6"] := Func("6")

if A_Args.Length() < 1
{
	InputBox, Port, PotPlayer network events reciver, Please enter a listening port`ncommand line argument can be the port number`n(for non interactive usage)`n`n%A_ScriptName% 1024,,,,,,,,1024
	if ErrorLevel
		ExitApp
	if Port is not integer
		ExitApp
}
else
{
	if a_args[1] is integer
		Port := a_args[1]
	else
	ExitApp
}
server := new HttpServer()
server.LoadMimes(A_ScriptDir . "/mime.types")
server.SetPaths(paths)
;server.Serve(1024) ;1024 Port of EventGhost Network Event Reciver
server.Serve(Port)
return

;Custom Network Events Functions
OK(ByRef req, ByRef res) {
	IfWinExist, PotPlayer
	{
		WinActivate, PotPlayer
		WinGetPos, X, Y, Width, Height, PotPlayer
		Send {space}
		guidisp("Play Pause",X, Y)
		res.SetBodyText("Play Pause")
	}
	else
	{
	guidisp("Pot Player NOT running",0, 0)
	res.SetBodyText("Pot Player NOT running")
	}
    res.status := 200
}

UP(ByRef req, ByRef res) {
IfWinExist, PotPlayer
{
	WinActivate, PotPlayer
	WinGetPos, X, Y, Width, Height, PotPlayer
	Send {up}
	guidisp("Volume Up",X, Y)
	res.SetBodyText("Volume Up")
}
else
{
	guidisp("Pot Player NOT running",0, 0)
	res.SetBodyText("Pot Player NOT running")
}
    res.status := 200
}

DOWN(ByRef req, ByRef res) {
IfWinExist, PotPlayer
{
	WinActivate, PotPlayer
	WinGetPos, X, Y, Width, Height, PotPlayer
	Send {down}
	guidisp("Volume Down",X, Y)
	res.SetBodyText("Volume Down")
}
else
{
	guidisp("Pot Player NOT running",0, 0)
	res.SetBodyText("Pot Player NOT running")
}
    res.status := 200
}

LEFT(ByRef req, ByRef res) {
IfWinExist, PotPlayer
{
	WinActivate, PotPlayer
	WinGetPos, X, Y, Width, Height, PotPlayer
	Send {left}
	guidisp("5 Sec. Backward",X, Y)
	res.SetBodyText("5 Sec. Backward")
}
else
{
	guidisp("Pot Player NOT running",0, 0)
	res.SetBodyText("Pot Player NOT running")
}
    res.status := 200
}

RIGHT(ByRef req, ByRef res) {
IfWinExist, PotPlayer
{
	WinActivate, PotPlayer
	WinGetPos, X, Y, Width, Height, PotPlayer
	Send {right}
	guidisp("5 Sec. Forward",X, Y)
	res.SetBodyText("5 Sec. Forward")
}
else
{
	guidisp("Pot Player NOT running",0, 0)
	res.SetBodyText("Pot Player NOT running")
}
    res.status := 200
}

3(ByRef req, ByRef res) {
IfWinExist, PotPlayer
{
	WinActivate, PotPlayer
	WinGetPos, X, Y, Width, Height, PotPlayer
	Send {e}
	guidisp("Brightness 1% Increase",X, Y)
	res.SetBodyText("Brightness 1% Increase")
}
else
{
	guidisp("Pot Player NOT running",0, 0)
	res.SetBodyText("Pot Player NOT running")
}
    res.status := 200
}

1(ByRef req, ByRef res) {
IfWinExist, PotPlayer
{
	WinActivate, PotPlayer
	WinGetPos, X, Y, Width, Height, PotPlayer
	Send {q}
	guidisp("Brightness Reset",X, Y)
	res.SetBodyText("Brightness Reset")
}
else
{
	guidisp("Pot Player NOT running",0, 0)
	res.SetBodyText("Pot Player NOT running")
}
    res.status := 200
}

2(ByRef req, ByRef res) {
IfWinExist, PotPlayer
{
	WinActivate, PotPlayer
	WinGetPos, X, Y, Width, Height, PotPlayer
	Send {w}
	guidisp("Brightness 1% Decrease",X, Y)
	res.SetBodyText("Brightness 1% Decrease")
}
else
{
	guidisp("Pot Player NOT running",0, 0)
	res.SetBodyText("Pot Player NOT running")
}
    res.status := 200
}

RED(ByRef req, ByRef res) {
IfWinExist, PotPlayer
{
	WinActivate, PotPlayer
	WinGetPos, X, Y, Width, Height, PotPlayer
	Send {space}
	WinMinimize, PotPlayer
	guidisp("Boss Key",X, Y)
	res.SetBodyText("Boss Key")
}
else
{
	guidisp("Pot Player NOT running",0, 0)
	res.SetBodyText("Pot Player NOT running")
}
    res.status := 200
}

7(ByRef req, ByRef res) {
IfWinExist, PotPlayer
{
	WinActivate, PotPlayer
	WinGetPos, X, Y, Width, Height, PotPlayer
	Send {PgUp}
	guidisp("Play Previous Item",X, Y)
	res.SetBodyText("Play Previous Item")
}
else
{
	guidisp("Pot Player NOT running",0, 0)
	res.SetBodyText("Pot Player NOT running")
}
    res.status := 200
}

9(ByRef req, ByRef res) {
IfWinExist, PotPlayer
{
	WinActivate, PotPlayer
	WinGetPos, X, Y, Width, Height, PotPlayer
	Send {PgDn}
	guidisp("Play Next Item",X, Y)
	res.SetBodyText("Play Next Item")
}
else
{
	guidisp("Pot Player NOT running",0, 0)
	res.SetBodyText("Pot Player NOT running")
}
    res.status := 200
}

GREEN(ByRef req, ByRef res) {
IfWinExist, PotPlayer
{
	WinActivate, PotPlayer
	WinGetPos, X, Y, Width, Height, PotPlayer
	Send {return}
	guidisp("Fullscreen Toggle (keep AR)",X, Y)
	res.SetBodyText("Fullscreen Toggle (keep AR)")
}
else
{
	guidisp("Pot Player NOT running",0, 0)
	res.SetBodyText("Pot Player NOT running")
}
    res.status := 200
}

MUTE(ByRef req, ByRef res) {
IfWinExist, PotPlayer
{
	WinActivate, PotPlayer
	WinGetPos, X, Y, Width, Height, PotPlayer
	Send {m}
	guidisp("Mute Volume",X, Y)
	res.SetBodyText("Mute Volume")
}
else
{
	guidisp("Pot Player NOT running",0, 0)
	res.SetBodyText("Pot Player NOT running")
}
    res.status := 200
}

POWER(ByRef req, ByRef res) {
IfWinExist, PotPlayer
{
	WinActivate, PotPlayer
	WinGetPos, X, Y, Width, Height, PotPlayer
	WinClose, PotPlayer
	guidisp("Quit PotPlayer",X, Y)
	res.SetBodyText("Quit PotPlayer")
}
else
{
	guidisp("Pot Player NOT running",0, 0)
	res.SetBodyText("Pot Player NOT running")
}
    res.status := 200
}

4(ByRef req, ByRef res) {
IfWinExist, PotPlayer
{
	WinActivate, PotPlayer
	WinGetPos, X, Y, Width, Height, PotPlayer
	Send #+{left}
	guidisp("Move To Next Desktop (to the left)",X, Y)
	res.SetBodyText("Move To Next Desktop (to the left)")
}
else
{
	guidisp("Pot Player NOT running",0, 0)
	res.SetBodyText("Pot Player NOT running")
}
    res.status := 200
}

6(ByRef req, ByRef res) {
IfWinExist, PotPlayer
{
	WinActivate, PotPlayer
	WinGetPos, X, Y, Width, Height, PotPlayer
	Send #+{right}
	guidisp("Move To Next Desktop (to the right)",X, Y)
	res.SetBodyText("Move To Next Desktop (to the right)")
}
else
{
	guidisp("Pot Player NOT running",0, 0)
	res.SetBodyText("Pot Player NOT running")
}
    res.status := 200
}

Sub(ByRef req, ByRef res) {
IfWinExist, PotPlayer
{
	WinActivate, PotPlayer
	WinGetPos, X, Y, Width, Height, PotPlayer
	Send  !{l}
	guidisp("Cycle Subtitle",X, Y)
	res.SetBodyText("Cycle Subtitle")
}
else
{
	guidisp("PotPlayer NOT running",0, 0)
	res.SetBodyText("PotPlayer NOT running")
}
    res.status := 200
}

Stop(ByRef req, ByRef res) {
IfWinExist, PotPlayer
{
	WinActivate, PotPlayer
	WinGetPos, X, Y, Width, Height, PotPlayer
	Send  {F4}
	guidisp("Stop",X, Y)
	res.SetBodyText("Stop")
}
else
{
	guidisp("PotPlayer NOT running",0, 0)
	res.SetBodyText("PotPlayer NOT running")
}
    res.status := 200
}



Logo(ByRef req, ByRef res, ByRef server) {
    server.ServeFile(res, A_ScriptDir . "/logo.png")
    res.status := 200
}

NotFound(ByRef req, ByRef res) {
    res.SetBodyText("Page not found")
}

Default(ByRef req, ByRef res) {
    res.SetBodyText("`n`tPotPlayer list of available network events:`n`n`t/ok - OK`n`t/up - UP`n`t/down - DOWN`n`t/left - LEFT`n`t/right - RIGHT`n`t/3 - 3`n`t/1 - 1`n`t/2 - 2`n`t/red - RED`n`t/7 - 7`n`t/9 - 9`n`t/green - GREEN`n`t/mute - MUTE`n`t/power - POWER`n`t/4 - 4`n`t/6 - 6")
    res.status := 200
}

#include, %A_ScriptDir%\AHKhttp.ahk
#include %A_ScriptDir%\AHKsock.ahk 

guidisp(text, x, y){
	Gui, +AlwaysOnTop +ToolWindow -SysMenu -Caption
	Gui, Color, ffffff ;changes background color
	Gui, Font, 000000 s20 wbold, Verdana ;changes font color, size and font
	Gui, Add, Text, x0 y0, %text% ;the text to display
	x := x + 10 ; Offest x
	y := y + 40 ; Offset y
	Length := StrLen(text)
	Length := Length * 19
	;Gui, Show, w210 h35 x%x% y%y% NoActivate
	Gui, Show, w%Length% h35 x%x% y%y% NoActivate

	sleep, 700
	Gui, Destroy
}