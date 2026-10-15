class Monitor;

OutputTrans outTr;
mailbox #(OutputTrans) mbx;

function new(mailbox #(OutputTrans) mbx)
    this.mbx = mbx;
endfunction


// whenever run is called, it should be inside "forever begin end".
task run(virtual my_bus intBus);
    outTr = new();

    @(intBus.cb)
    begin
        // Assumption: out1 and out2 are inputs in intBus.cb
        outTr.out1 = intBus.cb.out1;
        outTr.out2 = intBus.cb.out2;
        mbx.put(outTr);
    end 
endtask 


endclass 