class MemTrans;
logic [7:0] data_in;
logic [3:0] address;

function void print ();
    $display("data_in = %h", data_in);
    $display("address= %h", address);
endfunction

endclass

module ch5_ex1_mod;
initial begin
    MemTrans mem1;
    mem1 = new();  
end
endmodule 