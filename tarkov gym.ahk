; by J0nathan550 | https://github.com/J0nathan550/Tarkov-Gym-AHK | Version 1.0 | 25.01.25

#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , H
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input

global timings := [2397, 1627, 1637, 1667, 1727, 1707, 1732, 1657, 1647, 1607, 1522, 1462, 1467, 1422, 1352]

global currentIndex := 1
global isScriptRunning := false

~F::
{
    if (!isScriptRunning) {
        isScriptRunning := true
        currentIndex := 1
        SetTimer, PerformMouseClick, -1
    }
    return
}

PerformMouseClick:
{
    if (!isScriptRunning)
        return

    SendInput, {LButton down}
    DllCall("Sleep","UInt",43.2)
    SendInput, {LButton up}

    DllCall("Sleep","UInt",timings[currentIndex])

    currentIndex++
    if (currentIndex > timings.Length()) {
        isScriptRunning := false
        return
    }

    SetTimer, PerformMouseClick, -1
    return
}

Esc::ExitApp