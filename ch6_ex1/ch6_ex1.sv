class Exercise1;

rand bit [7:0] data;
rand bit [3:0] address;
constraint add_const {address inside {3,4};}

endclass : Exercise1

`define rand_Check(r) \
do begin \
    if (!r) begin \
        $display("randomization failed"); \
        $finish; \
    end \
end while (0)

module ch6_ex1;
initial begin
Exercise1 Ex1;
Ex1 = new();
`rand_Check(Ex1.randomize());
$display(Ex1.data, Ex1.address);
end 
endmodule 