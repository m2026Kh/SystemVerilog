class Exercise2;

bit [7:0] data = 8'd10;
rand bit [3:0] address;
constraint add_const {address dist {0:=10, [1:14]:=80, 15:=10};}

endclass : Exercise2

`define rand_Check(r) \
do begin \
    if (!r) begin \
        $display("randomization failed"); \
        $finish; \
    end \
end while (0)

module ch6_ex2;
initial begin
Exercise2 Ex2;
Ex2 = new();
`rand_Check(Ex2.randomize());
$display(Ex2.data, Ex2.address);
end 
endmodule 