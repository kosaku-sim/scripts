#SingleInstance force
SendMode,Input

; 左ボタン押しながらホイールスクロールでタスク切り替え
~LButton & WheelDown::AltTab
~LButton & WheelUp::ShiftAltTab

; us -> jis
*F15::send, {Blind}{``}
*+F15::send, {~}
$+2::Send, {@}
*&::send, {^}
*'::send, &
*(::send, *
*)::send, (
*+0::send, )
*=::send, {Blind}_
*^::send, {Blind}=
*~::send, {Blind}{+}
*@::send, {Blind}[
*`::send, {Blind}{{}
*[::send, {Blind}]
*{::send, {Blind}{}}
*]::send, {Blind}\
*}::send, {Blind}|
*+::send, {;}
*;::send, {Blind}{:} ; コロンの方が頻度多いのでShiftなし
+*::send, {Blind}"
*vkBA::send, {Blind}'

; remap Ctrl+Shift+w -> Alt+F4
^+w::Send,!{F4}

; 変換 -> imeOn
sc029::Send,{vk16}
;sc029::Send,{vkF4}

; 無変換 -> imeOff
*sc07B::Send,{vk1A}
;*sc07B::Send,{vkF3}

; 無変換 + IJKLで矢印キーの動作
sc07B & I::Send,{Blind}{Up}
sc07B & K::Send,{Blind}{Down}
sc07B & J::Send,{Blind}{Left}
sc07B & L::Send,{Blind}{Right}

sc07B & U::Send,{Blind}^{Left}
sc07B & O::Send,{Blind}^{Right}

sc07B & Y::Send,{Blind}{Home}
sc07B & P::Send,{Blind}{End}

; Enter Backspace Delete
sc07B & @::Send,{Blind}{Delete}
sc07B & +::Send,{Blind}{Enter}
sc07B & vkBA::Send,{Blind}{Backspace}

; 無変換+Q -> Esc
sc07B & Q:: Send,{Blind}{ESC}

; 無変換+カーソル -> Home End PgUp PgDn
sc07B & Left::Send,{Blind}{Home}
sc07B & Right::Send,{Blind}{End}
sc07B & Up::Send,{Blind}{PgUp}
sc07B & Down::Send,{Blind}{PgDn}

; 無変換+下段キー タスクのダイレクト切り替え
sc07B & Z:: Send,{Blind}#1
sc07B & X:: Send,{Blind}#2
sc07B & C:: Send,{Blind}#3
sc07B & V:: Send,{Blind}#4
sc07B & B:: Send,{Blind}#5
sc07B & N:: Send,{Blind}#6
sc07B & M:: Send,{Blind}#7
sc07B & sc033:: Send,{Blind}#8
sc07B & sc034:: Send,{Blind}#9
sc07B & sc035:: Send,{Blind}#0

; 無変換+数字 -> Function
sc07B & 1:: Send,{Blind}{F1}
sc07B & 2:: Send,{Blind}{F2}
sc07B & 3:: Send,{Blind}{F3}
sc07B & 4:: Send,{Blind}{F4}        ; F4のみAlt+F4(アプリ閉じる)
sc07B & 5:: Send,{Blind}{F5}
sc07B & 6:: Send,{Blind}{F6}
sc07B & 7:: Send,{Blind}{F7}
sc07B & 8:: Send,{Blind}{F8}
sc07B & 9:: Send,{Blind}{F9}
sc07B & 0:: Send,{Blind}{F10}
sc07B & -:: Send,{Blind}{F11}
sc07B & ^:: Send,{Blind}{F12}

;; 左マウス時にテンキーを使いやすくする ;;

; Numpad5      -> コンテキストメニュー
NumpadClear::Send, {Blind}{vk5D}

; Numpad Insert Delete Enter -> Cut Copy Paste
NumpadIns::^x
NumpadDel::^c
NumpadEnter::^v

; Numpad += 拡大縮小
NumpadSub::
  if(GetKeyState("NumLock", "T")) {
     Send,{NumpadSub}
  } else {
     Send,^{NumpadSub}
  }
Return
NumpadAdd::
  if(GetKeyState("NumLock", "T")) {
     Send,{NumpadAdd}
  } else {
     Send,^{NumpadAdd}
  }
Return

NumpadEnd::Send, {vkF3}

; Shift+LCtrl -> Toggle CapsLock
*~LCtrl::
  Keywait, LCtrl, U
  Keywait, LCtrl, D T0.2 ; 2回連続でLCtrlが押された場合だけスルー
  If (ErrorLevel=1) {
    Send {Blind}{vk07}
  }
  Return
+LCtrl up::
    if GetKeyState("Shift","P") {
        if (A_PriorHotkey == "*~LCtrl" && A_PriorKey == "LControl")
        {
            ; ローカルの場合は確実な方法にする（リモートはリモートの状態が取れないので）
            If WinActive("ahk_class TscShellContainerClass") {
                Send +{vkf0}
            } else {
                if GetKeyState("CapsLock", "T") = 1
                {
                    SetCapsLockState, off
                }
                else if GetKeyState("CapsLock", "F") = 0
                {
                    SetCapsLockState, on
                }
            }
        }
    }
    Return

; リモートデスクトップのアクティブでリロード
; リモートデスクトップがフルスクリーンになるとAutoHotKeyが反映されない問題に対処する
vkFF::
If WinActive("ahk_class TscShellContainerClass")
{  
  Reload
  Sleep 1000
}
Return

; QM Console WindowへUのキー変換(Windowタイトルで判断)
#IfWinActive, QM

^Space::Send,{Blind}+{F11}
^+1::Send,{F2}

; Windows10 の Console Virtual Terminal Sequences と QM3.4-12以上だと以下不要となる
; ^Right::Send,!{F1} 
; ^Left::Send,!{F2}
; ^Down::Send,!{F3}
; ^Up::Send,!{F4}
; +Left::Send,!{F5}
; +Right::Send,!{F6}
; +Up::Send,!{F7}
; +Down::Send,!{F8}
; +Home::Send,!{F9}
; +End::Send,+{F12}
; ^+Right::Send,!{F11}
; ^+Left::Send,!{F12}
; ^+Down::Send,+{F1}
; ^+Up::Send,+{F2}
; +PgUp::Send,+{F4}
; ^+PgDn::Send,+{F5}
; ^+PgUp::Send,+{F6}
; ^+Home::Send,+{F7}
; ^+End::Send,+{F8}
; !Left::Send,+{F9}
; !Right::Send,+{F10}
; +PgDn::Send,^{F12}
; ^Backspace::Send,^{F10}
; ^Delete::Send,!{F10}

return

; minttyでペーストをリマップ Ctrl+v -> Ctrl+Shift+v
#IfWinActive, ahk_class mintty
^v::
  IfWinNotActive QM [console]
  {
    Send,{Blind}+{Insert}
  }
  else
  {
    Send,{Blind}^v
  }
  return
return
