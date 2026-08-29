class MemTrans;
    rand bit rw;          // read if rw=0, write if rw=1
    rand bit [7:0] data_in;
    rand bit [3:0] address;

constraint read_const {
    if (rw == 0)
        address inside {[0:7]};
    }
endclass // MemTrans

`define mem_randomize_check(r) \
do begin \
if (r == 0) \
begin \
    $display("randomize failed"); \
    $finish; \
end \
end while (0)

module  ch6_ex7;
MemTrans mem;

initial begin
mem = new();
mem.read_const.constraint_mode(0);
do begin
`mem_randomize_check(mem.randomize() with {if (rw ==0 )
                                                address inside {[0:8]};}
                                            );
end while (mem.rw == 1 || mem.address != 8);

$display("address = %0d rw == %0d", mem.address, mem.rw);

end
    
endmodule