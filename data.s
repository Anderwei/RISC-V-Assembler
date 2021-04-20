L6:     lui x23,12345
        auipc x10,1561208   
        jal x23,L1
L5:     jalr x23,x29,0
        beq x0,x15,L2
        bne x14,x28,L3
        blt x5,x6,L4
        bge x7,x9,L5
L7:     bltu x0,x21,L6
        bgeu x12,x15,L7
        lb x10,-24(x13)
L1:     lh x11,-8(x12)
        lw x17,0(x15)
        lbu x24,8(x16)
        lhu x23,16(x27)
        sb x30,24(x19)
        sh x31,32(x7)
L2:     sw x23,-32(x6)
        addi x18,x14,-10
        slti x24,x22,0
        sltiu x27,x28,-0
L3:     xori x18,x29,-4
        ori x16,x13,-2
        andi x23,x19,0
L4:     slli x21,x20,2
        srli x24,x25,4
        srai x6,x7,6
        add x13,x10,x18
        sub x11,x12,x17
        sll x17,x19,x19
        slt x16,x21,x0
        sltu x10,x27,x0
        xor x14,x26,x9
        srl x11,x25,x6
        sra x19,x18,x15
        or x18,x22,x22
        and x20,x21,x24
        mul x25,x21,x31
        mulh x6,x7,x30
        mulhsu x10,x21,x29
        mulhu x22,x21,x16
        div x29,x9,x9
        divu x30,x6,x12
        rem x31,x19,x17
        remu x27,x20,x15