class MemTrans;
logic [7:0] data_in;
logic [3:0] address;

function new(input logic [7:0] data = 0, input logic [3:0] addr = 0);
    data_in = data;
    address = addr;
endfunction

function void print ();
    $display("data_in = %h", data_in);
    $display("address= %h", address);
endfunction

endclass

module ch5_ex3_mod;
initial begin
    MemTrans mem1, mem2;
    mem1 = new(.addr(2));  
    mem2 = new(.addr(4), .data(3)); 
end
endmodule 