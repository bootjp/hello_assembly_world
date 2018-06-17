# assembly study

## nasm

```bash
brew install nasm
nasm -v
> NASM version 2.13.02 compiled on Nov 30 2017
nasm -f macho64 -o sample.o  scratch.asm && ld -o sample.out sample.o && ./sample.out
```


## masm

base document: http://wisdom.sakura.ne.jp/programming/asm/index.html

current : http://wisdom.sakura.ne.jp/programming/asm/assembly7.html

use DOSBox
+ https://www.dosbox.com/
   
+ 8086 Assembler

* ToDo  
  + [ ] DOSBox change keyboard layout 
     + [official documents](https://www.dosbox.com/DOSBoxManual.html#KeyboardLayout)
     + [question](https://superuser.com/questions/1080381/keyboard-layout-setting-in-dosbox-has-no-effect)
     + [ ] DOSBox build for high Sierra
     * japanese keyboard layout = 106
* dosbox howt to use.
  ```dos
  mount c ~/dosbox # ~/doxbosはosx環境上
  c:\
  debug
  ```
  


## study

### レジスタ
  * 汎用レジスタ (何に使ってもよい、Ex 変数)
     + AX アキュムレータ
     + BX ベースレジ
     + CX カウントレジスタ (ループなどのカウンタに使いことが多い)
     + DX データレジスタ
  * インデックスレジスタ
     + SI ソースインデックス
     + DI ディスティネーションインデックス
  * 特殊レジスタ
     + BP ベースポインタ
     + SP スタックポインタ
     + IP イントラクションポインタ
  * セグメントレジスタ
     + CS コードセグメント
     + DS データセグメント
     + ES エクストラセグメント
     + SS スタックセグメント 
     
### 汎用レジスタについて
  + 汎用レジスタは16ビットで構成される場合、8ビットを二つ組み合わせている
  + AXレジスタの実体は8ビットのAHとALレジスタの二つが実体
    + AHはAXの上位8ビット (High)
    + ALはAXの上位8ビット (Low)
  + 同様にBX, CX, DXの汎用レジスタは8ビット毎に分割されている
    + 不明点: 今は16ビットなので High Lowだけど32, 64だと？
        + 64ビットでは上位概念としてEAXレジスタがあり、EXレジスターをラップするRAXレジスタというものがあるようだ。
        + 64ビットではAXレジスタは4つ存在し、AXレジスタを管理する(?)EAXレジスタがあり
        + EAX レジスタも二つあり、EAXレジスタを管理する(?) RAXレジスタがある
        + ref: http://www.mztn.org/lxasm64/amd04.html

### 命令形
  * MOV (レジスタ|メモリ)へのデータ転送
     + 高級言語でいう代入
     * 第一オペランドがdest(値を転送される側、保存対象領域を指定する)
     * 第二オペランドがsource(代入を行う(レジスタ、メモリアドレス、数値))
     + 非破壊読み取りである。データ代入しても元の領域の値は壊れない（いわゆる参照渡しではない？）
     * ニーモニックというものの一つに分類される(?)

### リトルエンディアン

```
-A 100 103
    MOV AX, 1234
    
-G=100 103

AX=1234...（略
```
これを逆アセンブルして見てみると

```
-U 100 103
073F:0100 B83412 MOV AX, 1234
073F:0103 0000   ADD [BX+SI],AL
```
となっている8086命令形ではリトル･エンディアンマシンというらしく、
ワードのバイトは下位から順にアドレスが割り当てられる。

注意すべきはバイト毎に割り当てるということであり、単純に `4321` とはならない `3412` となる。

### 8086のアドレスについて

* アセンブリであっても物理アドレスへのアクセスの指定はできない
* セグメント方式が採用されている
* セグメントに対してオフセットがある
  + これらを計算することで物理アドレスを導き出すことができる
  * これらをセグメントベースという
  * セグメントベースは16進数の5桁で表されるため0-f * 5 = 1MB
  * オフセットアドレスは4桁16進数 = 64KB
  
### セグメントレジスタ
 * セグメントレジスタはセグメントアドレスを指定するのに用いられる
 ＊ メモリアクセス時コンピュータはセグメントレジスタ経由で参照をする
 * セグメントレジスタは合計4つ存在しそれぞれに専用の役割が存在する(64bitでは?）
 * セグメントレジスタはCS（コード）, DS（データ）, ES（エクストラ), SS（スタック）の4つがあり，CSではコード・レジスタとなる
 * CSレジスタは自分自身のセグメントレジスタを指す
   - 実行中の機械語を格納しているアドレスである
   - CPUが機械語を実行する際に使う
 * DSレジスタはデータを格納する専用のセグメントを指す
 * ESレジスタはDSレジスタのようなものでデータ以外にセグメントが必要なときに使う
 * SSレジスタはスタック操作に使用する
 

