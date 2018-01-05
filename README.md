# assembly study

## nasm

```bash
brew install nasm
nasm -v
> NASM version 2.13.02 compiled on Nov 30 2017
nasm -f macho64 -o sample.o  scratch.asm && ld -o sample.out sample.o && ./sample.out
```


## masm

document: http://wisdom.sakura.ne.jp/programming/asm/index.html

current : http://wisdom.sakura.ne.jp/programming/asm/assembly3.html

use dosbox
+ https://www.dosbox.com/
   
+ 8086 Assembler

* ToDo  
  [] dosbox change keyboard layout 
     + [official documents](https://www.dosbox.com/DOSBoxManual.html#KeyboardLayout)
     + [question](https://superuser.com/questions/1080381/keyboard-layout-setting-in-dosbox-has-no-effect)
     + [ ] dos box build for high Sierra

# 
* japanese keyboard layout = 106
