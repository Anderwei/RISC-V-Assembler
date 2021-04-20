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
```mermaid
graph LR;
P[Instruction] --> U[U-type Ins]
P[Instruction] --> UJ[UJ-type Ins.]
P[Instruction] --> I[I-type Ins.]
P[Instruction] --> SB[SB-type Ins.]
P[Instruction] --> S[S-type Ins.]
P[Instruction] --> R[R-type Ins.]
U --> U1(lui)
U --> U2(auipc)

UJ --> UJ1(jal)

I --> I1(jalr)
I --> I2(load)
I --> I3(int-Imme)

SB --> SB1(Branch)


S --> S1((save))

R --> R1(shift-Imme)
R --> R2(int-imme)
R --> R3(shift-reg)
R --> R4(Mul-reg)

```

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

