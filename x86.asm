.486
.model flat, stdcall
option casemap :none

.code

TestProc proc dwValue:DWORD

   mov eax, dwValue
   add eax, 100
   ret

TestProc endp

end
