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

module ch6_ex4;

initial begin

int count[16], maxVal[$];
Exercise2 Ex2;
Ex2 = new();

repeat (1000) begin
    `rand_Check(Ex2.randomize());
     count[Ex2.address] ++;
end 
maxVal = count.max();
foreach(count[i]) begin
    $write("address %0d = repeat %4d", i, count[i]);
    repeat (count[i]*10/maxVal[0]) $write("o");
    $display;
end

end
endmodule 