interface my_if(input bit clk);
    bit write;
    bit [15:0] data_in;
    bit [7:0] address;
    logic [15:0] data_out;

clocking cbn @(negedge clk);
    input data_in;
    output data_out;
    output address;
endclocking 

modport master (clocking cbn, output write);
modport slave (output data_in, input data_out, input address, input write);

endinterface