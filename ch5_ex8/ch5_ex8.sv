package my_package; 
class  Transaction;
endclass : Transaction
endpackage 

program automatic test;

import my_package ::*; 


initial begin
Transaction tArrayHandle[]; // dynamic array
tArrayHandle = new[5]; // give the array 5 elements
generator (.tArray(tArrayHandle));
end

task generator (ref Transaction tArray[]);
foreach (tArray[i]) begin
tArray[i] = new();
transmit (tArray[i]);
end
endtask : generator

task transmit (Transaction tr);
endtask : transmit

endprogram
