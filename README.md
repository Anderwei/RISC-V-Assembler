# RISC-V Assmebler

A program convert risc-v to machine code  

implement set :  
Set Name | description
-------- | -----------
RV32I    | without fench
RV32M    | 

## Build Instruction

require `gnu-gcc 4.3.5` or higher


```bash
g++ -Wall -std=c++14 -g main.cpp -o main
```

## Run Program
``` bash
./main [risc-v file]
```

## Program Explanation
#### Program Inheritance Graph
![Alt text](./picture/inheritance_graph.svg)

---
### General variable

variable    | type    | description
---       | ---     |  ---
*insts*    | map<string,vector<string>> | store instruction's information<br> key is inst's name
*insts[ins name]*    | vector<string> |  store Func3,Func2,Func5 in order<br> is "" if empty
*FUNC3* | int=0 | position in insts[ins name]
*FUNC2* | int=1 | position in insts[ins name]
*FUNC5* | int=2 | position in insts[ins name]

---

### Instruction

**Member**
Name    | type    | description
---       | ---     |  ---
*name*    | string  | Instruction name
*rd*      | string  | distanation register
*rs1*     | string  | source register 1
*rs2*     | string  | source register 2
*opcode*  | string  | this ins. group's opcode, set by child class
*imme*    | int     | any number
*insts*   | map<string,vector<string>>* | pointer to child class's insts, set by child class

**Member Function**
Name | arg  | return type
---        | ---        | ---        
*translateResult* | **None** |  string 
*intToBin* | **int** num<br>**int** size<br>**bool** reversed=true | string

#### translateResult  
* pure virtual function, *implenment by child class*
#### intToBin
* static function
* return ++binary version++ of num, which len is size

```
intToBin(12,4,true);
> "1100"
intToBin(12,4,false);
> "0011"
intToBin(-2,6,true);
> "111110"
```

---
### \{U | UJ | I | SB | S | R\} Type Instruction

[![](https://mermaid.ink/img/eyJjb2RlIjoiY2xhc3NEaWFncmFtXG5jbGFzcyBJbnN0cnVjdGlvbiB7XG4gICAgc3RyaW5nIG5hbWVcbiAgICBzdHJpbmcgcmRcbiAgICBzdHJpbmcgcnMxXG4gICAgc3RyaW5nIHJzMlxuICAgIHN0cmluZyBvcGNkb2VcbiAgICBpbnQgaW1tZVxuICAgIG1hcDxzdHJpbmcsdmVjdG9yPHN0cmluZz4-KiBpbnN0c1xuICAgIHZpcnR1YWwgdHJhbnNsYXRlUmVzdWx0KCkgPSAwXG4gICAgaW50VG9CaW4oaW50IG51bSxpbnQgc2l6ZSxib29sIHJldmVyc2VkPXRydWUpXG59XG5jbGFzcyBVX1R5cGV7XG4gICAgc3RyaW5nIHRyYW5zbGF0ZVJlc3VsdCgpXG59XG5jbGFzcyBVSl9UeXBle1xuICAgIHN0cmluZyB0cmFuc2xhdGVSZXN1bHQoKVxufVxuY2xhc3MgSV9UeXBle1xuICAgIHN0cmluZyB0cmFuc2xhdGVSZXN1bHQoKVxufVxuY2xhc3MgU0JfVHlwZXtcbiAgICBzdHJpbmcgdHJhbnNsYXRlUmVzdWx0KClcbn1cbmNsYXNzIFNfVHlwZXtcbiAgICBzdHJpbmcgdHJhbnNsYXRlUmVzdWx0KClcbn1cbmNsYXNzIFJfVHlwZXtcbiAgICBzdHJpbmcgdHJhbnNsYXRlUmVzdWx0KClcbn1cbkluc3RydWN0aW9uIC0tPiBVX1R5cGVcbkluc3RydWN0aW9uIC0tPiBVSl9UeXBlXG5JbnN0cnVjdGlvbiAtLT4gSV9UeXBlXG5JbnN0cnVjdGlvbiAtLT4gU0JfVHlwZVxuSW5zdHJ1Y3Rpb24gLS0-IFNfVHlwZVxuSW5zdHJ1Y3Rpb24gLS0-IFJfVHlwZVxuXG5jbGFzcyBsdWl7XG4gICAgbWFwPHN0cmluZyx2ZWN0b3I8c3RyaW5nPj4gaW5zdHNfbmFtZXNcbiAgICBib29sIGlzVGhpc1R5cGUoc3RyaW5nIG5hbWUpXG59XG5jbGFzcyBhdWlwY3tcbiAgICBtYXA8c3RyaW5nLHZlY3RvcjxzdHJpbmc-PiBpbnN0c19uYW1lc1xuICAgIGJvb2wgaXNUaGlzVHlwZShzdHJpbmcgbmFtZSlcbn1cbmNsYXNzIGphbHtcbiAgICBtYXA8c3RyaW5nLHZlY3RvcjxzdHJpbmc-PiBpbnN0c19uYW1lc1xuICAgIGJvb2wgaXNUaGlzVHlwZShzdHJpbmcgbmFtZSlcbn1cbmNsYXNzIGphbHJ7XG4gICAgbWFwPHN0cmluZyx2ZWN0b3I8c3RyaW5nPj4gaW5zdHNfbmFtZXNcbiAgICBib29sIGlzVGhpc1R5cGUoc3RyaW5nIG5hbWUpXG59XG5jbGFzcyBicmFuY2h7XG4gICAgbWFwPHN0cmluZyx2ZWN0b3I8c3RyaW5nPj4gaW5zdHNfbmFtZXNcbiAgICBib29sIGlzVGhpc1R5cGUoc3RyaW5nIG5hbWUpXG59XG5jbGFzcyBsb2Fke1xuICAgIG1hcDxzdHJpbmcsdmVjdG9yPHN0cmluZz4-IGluc3RzX25hbWVzXG4gICAgYm9vbCBpc1RoaXNUeXBlKHN0cmluZyBuYW1lKVxufVxuY2xhc3Mgc2F2ZXtcbiAgICBtYXA8c3RyaW5nLHZlY3RvcjxzdHJpbmc-PiBpbnN0c19uYW1lc1xuICAgIGJvb2wgaXNUaGlzVHlwZShzdHJpbmcgbmFtZSlcbn1cbmNsYXNzIGludF9pbW1le1xuICAgIG1hcDxzdHJpbmcsdmVjdG9yPHN0cmluZz4-IGluc3RzX25hbWVzXG4gICAgYm9vbCBpc1RoaXNUeXBlKHN0cmluZyBuYW1lKVxufVxuY2xhc3Mgc2hpZnRfaW1tZXtcbiAgICBtYXA8c3RyaW5nLHZlY3RvcjxzdHJpbmc-PiBpbnN0c19uYW1lc1xuICAgIGJvb2wgaXNUaGlzVHlwZShzdHJpbmcgbmFtZSlcbn1cbmNsYXNzIGludF9yZWd7XG4gICAgbWFwPHN0cmluZyx2ZWN0b3I8c3RyaW5nPj4gaW5zdHNfbmFtZXNcbiAgICBib29sIGlzVGhpc1R5cGUoc3RyaW5nIG5hbWUpXG59XG5jbGFzcyBzaGlmdF9yZWd7XG4gICAgbWFwPHN0cmluZyx2ZWN0b3I8c3RyaW5nPj4gaW5zdHNfbmFtZXNcbiAgICBib29sIGlzVGhpc1R5cGUoc3RyaW5nIG5hbWUpXG59XG5jbGFzcyBtdWxfcmVne1xuICAgIG1hcDxzdHJpbmcsdmVjdG9yPHN0cmluZz4-IGluc3RzX25hbWVzXG4gICAgYm9vbCBpc1RoaXNUeXBlKHN0cmluZyBuYW1lKVxufVxuVV9UeXBlIC0tPiBsdWlcblVfVHlwZSAtLT4gYXVpcGNcblVKX1R5cGUgLS0-IGphbFxuSV9UeXBlIC0tPiBqYWxyXG5TQl9UeXBlIC0tPiBicmFuY2hcbklfVHlwZSAtLT4gbG9hZFxuU19UeXBlIC0tPiBzYXZlXG5JX1R5cGUgLS0-IGludF9pbW1lXG5SX1R5cGUgLS0-IHNoaWZ0X2ltbWVcblJfVHlwZSAtLT4gaW50X3JlZ1xuUl9UeXBlIC0tPiBzaGlmdF9yZWdcblJfVHlwZSAtLT4gbXVsX3JlZ1xuIiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifSwidXBkYXRlRWRpdG9yIjpmYWxzZX0)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiY2xhc3NEaWFncmFtXG5jbGFzcyBJbnN0cnVjdGlvbiB7XG4gICAgc3RyaW5nIG5hbWVcbiAgICBzdHJpbmcgcmRcbiAgICBzdHJpbmcgcnMxXG4gICAgc3RyaW5nIHJzMlxuICAgIHN0cmluZyBvcGNkb2VcbiAgICBpbnQgaW1tZVxuICAgIG1hcDxzdHJpbmcsdmVjdG9yPHN0cmluZz4-KiBpbnN0c1xuICAgIHZpcnR1YWwgdHJhbnNsYXRlUmVzdWx0KCkgPSAwXG4gICAgaW50VG9CaW4oaW50IG51bSxpbnQgc2l6ZSxib29sIHJldmVyc2VkPXRydWUpXG59XG5jbGFzcyBVX1R5cGV7XG4gICAgc3RyaW5nIHRyYW5zbGF0ZVJlc3VsdCgpXG59XG5jbGFzcyBVSl9UeXBle1xuICAgIHN0cmluZyB0cmFuc2xhdGVSZXN1bHQoKVxufVxuY2xhc3MgSV9UeXBle1xuICAgIHN0cmluZyB0cmFuc2xhdGVSZXN1bHQoKVxufVxuY2xhc3MgU0JfVHlwZXtcbiAgICBzdHJpbmcgdHJhbnNsYXRlUmVzdWx0KClcbn1cbmNsYXNzIFNfVHlwZXtcbiAgICBzdHJpbmcgdHJhbnNsYXRlUmVzdWx0KClcbn1cbmNsYXNzIFJfVHlwZXtcbiAgICBzdHJpbmcgdHJhbnNsYXRlUmVzdWx0KClcbn1cbkluc3RydWN0aW9uIC0tPiBVX1R5cGVcbkluc3RydWN0aW9uIC0tPiBVSl9UeXBlXG5JbnN0cnVjdGlvbiAtLT4gSV9UeXBlXG5JbnN0cnVjdGlvbiAtLT4gU0JfVHlwZVxuSW5zdHJ1Y3Rpb24gLS0-IFNfVHlwZVxuSW5zdHJ1Y3Rpb24gLS0-IFJfVHlwZVxuXG5jbGFzcyBsdWl7XG4gICAgbWFwPHN0cmluZyx2ZWN0b3I8c3RyaW5nPj4gaW5zdHNfbmFtZXNcbiAgICBib29sIGlzVGhpc1R5cGUoc3RyaW5nIG5hbWUpXG59XG5jbGFzcyBhdWlwY3tcbiAgICBtYXA8c3RyaW5nLHZlY3RvcjxzdHJpbmc-PiBpbnN0c19uYW1lc1xuICAgIGJvb2wgaXNUaGlzVHlwZShzdHJpbmcgbmFtZSlcbn1cbmNsYXNzIGphbHtcbiAgICBtYXA8c3RyaW5nLHZlY3RvcjxzdHJpbmc-PiBpbnN0c19uYW1lc1xuICAgIGJvb2wgaXNUaGlzVHlwZShzdHJpbmcgbmFtZSlcbn1cbmNsYXNzIGphbHJ7XG4gICAgbWFwPHN0cmluZyx2ZWN0b3I8c3RyaW5nPj4gaW5zdHNfbmFtZXNcbiAgICBib29sIGlzVGhpc1R5cGUoc3RyaW5nIG5hbWUpXG59XG5jbGFzcyBicmFuY2h7XG4gICAgbWFwPHN0cmluZyx2ZWN0b3I8c3RyaW5nPj4gaW5zdHNfbmFtZXNcbiAgICBib29sIGlzVGhpc1R5cGUoc3RyaW5nIG5hbWUpXG59XG5jbGFzcyBsb2Fke1xuICAgIG1hcDxzdHJpbmcsdmVjdG9yPHN0cmluZz4-IGluc3RzX25hbWVzXG4gICAgYm9vbCBpc1RoaXNUeXBlKHN0cmluZyBuYW1lKVxufVxuY2xhc3Mgc2F2ZXtcbiAgICBtYXA8c3RyaW5nLHZlY3RvcjxzdHJpbmc-PiBpbnN0c19uYW1lc1xuICAgIGJvb2wgaXNUaGlzVHlwZShzdHJpbmcgbmFtZSlcbn1cbmNsYXNzIGludF9pbW1le1xuICAgIG1hcDxzdHJpbmcsdmVjdG9yPHN0cmluZz4-IGluc3RzX25hbWVzXG4gICAgYm9vbCBpc1RoaXNUeXBlKHN0cmluZyBuYW1lKVxufVxuY2xhc3Mgc2hpZnRfaW1tZXtcbiAgICBtYXA8c3RyaW5nLHZlY3RvcjxzdHJpbmc-PiBpbnN0c19uYW1lc1xuICAgIGJvb2wgaXNUaGlzVHlwZShzdHJpbmcgbmFtZSlcbn1cbmNsYXNzIGludF9yZWd7XG4gICAgbWFwPHN0cmluZyx2ZWN0b3I8c3RyaW5nPj4gaW5zdHNfbmFtZXNcbiAgICBib29sIGlzVGhpc1R5cGUoc3RyaW5nIG5hbWUpXG59XG5jbGFzcyBzaGlmdF9yZWd7XG4gICAgbWFwPHN0cmluZyx2ZWN0b3I8c3RyaW5nPj4gaW5zdHNfbmFtZXNcbiAgICBib29sIGlzVGhpc1R5cGUoc3RyaW5nIG5hbWUpXG59XG5jbGFzcyBtdWxfcmVne1xuICAgIG1hcDxzdHJpbmcsdmVjdG9yPHN0cmluZz4-IGluc3RzX25hbWVzXG4gICAgYm9vbCBpc1RoaXNUeXBlKHN0cmluZyBuYW1lKVxufVxuVV9UeXBlIC0tPiBsdWlcblVfVHlwZSAtLT4gYXVpcGNcblVKX1R5cGUgLS0-IGphbFxuSV9UeXBlIC0tPiBqYWxyXG5TQl9UeXBlIC0tPiBicmFuY2hcbklfVHlwZSAtLT4gbG9hZFxuU19UeXBlIC0tPiBzYXZlXG5JX1R5cGUgLS0-IGludF9pbW1lXG5SX1R5cGUgLS0-IHNoaWZ0X2ltbWVcblJfVHlwZSAtLT4gaW50X3JlZ1xuUl9UeXBlIC0tPiBzaGlmdF9yZWdcblJfVHlwZSAtLT4gbXVsX3JlZ1xuIiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifSwidXBkYXRlRWRpdG9yIjpmYWxzZX0)