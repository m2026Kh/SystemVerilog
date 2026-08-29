package p;

typedef enum  {READ, WRITE} rw_e;

class Transaction;
    rand rw_e rw;
    rand bit [31:0] addr, data;
endclass


class RandTransaction;

    rand Transaction trans_array[];

    constraint rw_c {
        foreach (trans_array[i])
            if ((i > 0) && (trans_array[i-1].rw == WRITE))
                trans_array[i].rw != WRITE;
            else if ((i >0) && (trans_array[i-1].rw == READ) && (trans_array[i].rw == READ))
                 trans_array[i-1].addr != trans_array[i].addr;
    }

    function new(int TESTS);
        trans_array = new[TESTS];
        foreach (trans_array[i])
            trans_array[i] = new();
    endfunction

endclass

endpackage

`define rand_Check(r) \
do begin \
if (!r) \
    begin \
    $display("ranodmize failed"); \
    $finish; \
    end \
end while(0) 

module ch6_ex11;

import p::*;
RandTransaction RandTrans;

initial begin
RandTrans = new(20);
`rand_Check(RandTrans.randomize());

foreach (RandTrans.trans_array[i]) begin
    $display("transactionTye = %s, repeat %0d = this addr 0x%0h", 
    RandTrans.trans_array[i].rw.name(), i, RandTrans.trans_array[i].addr);
end

end
endmodule