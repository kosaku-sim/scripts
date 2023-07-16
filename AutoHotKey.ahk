#SingleInstance force
SendMode,Input

; NumpadEnd -> toggle Capslock
NumpadEnd::
    if GetKeyState("CapsLock", "T") = 1
    {
        SetCapsLockState, off
    }
    else if GetKeyState("CapsLock", "F") = 0
    {
        SetCapsLockState, on
    }      
    Return

; us -> jis
*F15::send, {``}
*+F15::send,{~}
$+2::Send,{@}
*&::send, {^}
*'::send, &
*(::send, *
*)::send, (
*+0::send, )
*=::send, _
*^::send, =
*~::send, {+}
*@::send, [
*`::send, {{}
*[::send, ]
*{::send, {}}
*]::send, \
*}::send, |
*+::send, {;}
*;::send, {:} ; �R�����̕����p�x�����̂�Shift�Ȃ�
+*::send, "
*vkBA::send, '

; �ϊ� -> imeOn
sc029::Send,{vk16}

; ���ϊ� -> imeOff
*sc07B::Send,{vk1A}

; ���ϊ�+IJKL�Ŗ��L�[�̓���
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
sc07B & VKBB::Send,{Blind}{Enter}
sc07B & VKBA::Send,{Blind}{Backspace}

; ���ϊ�+Q -> Esc
sc07B & Q:: Send,{Blind}{ESC}

; ���ϊ�+�J�[�\�� -> Home End PgUp PgDn
sc07B & Left::Send,{Blind}{Home}
sc07B & Right::Send,{Blind}{End}
sc07B & Up::Send,{Blind}{PgUp}
sc07B & Down::Send,{Blind}{PgDn}

; ���ϊ�+�E��A���t�@�x�b�g�L�[ -> Ctrl+�A���t�@�x�b�g�L�[
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

; ���ϊ�+���� -> Function
sc07B & 1:: Send,{Blind}{F1}
sc07B & 2:: Send,{Blind}{F2}
sc07B & 3:: Send,{Blind}{F3}
sc07B & 4:: Send,!{F4}        ; F4�̂�Alt+F4(�A�v������)
sc07B & 5:: Send,{Blind}{F5}
sc07B & 6:: Send,{Blind}{F6}
sc07B & 7:: Send,{Blind}{F7}
sc07B & 8:: Send,{Blind}{F8}
sc07B & 9:: Send,{Blind}{F9}
sc07B & 0:: Send,{Blind}{F10}
sc07B & -:: Send,{Blind}{F11}
sc07B & ^:: Send,{Blind}{F12}

;; ���}�E�X���Ƀe���L�[���g���₷������ ;;

; Numpad5      -> �R���e�L�X�g���j���[
NumpadClear::Send, +{F10}

; Numpad Insert Delete Enter -> Cut Copy Paste
NumpadIns::^x
NumpadDel::^c
NumpadEnter::^v

; Numpad += �g��k��
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

; �����[�g�f�X�N�g�b�v�̃A�N�e�B�u�Ń����[�h
; �����[�g�f�X�N�g�b�v���t���X�N���[���ɂȂ��AutoHotKey�����f����Ȃ����ɑΏ�����
vkFF::
If WinActive("ahk_class TscShellContainerClass")
{  
  Reload
  Sleep 1000
}
Return

; QM Console Window��U�̃L�[�ϊ�(Window�^�C�g���Ŕ��f)
#IfWinActive, QM

^Space::Send,{Blind}+{F11}
^+1::Send,{F2}

; Windows10 �� Console Virtual Terminal Sequences �� QM3.4-12�ȏゾ�ƈȉ��s�v�ƂȂ�
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

; mintty�Ńy�[�X�g�����}�b�v Ctrl+v -> Ctrl+Shift+v
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
