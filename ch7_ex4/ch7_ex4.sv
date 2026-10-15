task wait10(semaphore  sem);

for (int i =0 ; i< 10; i++)
begin
    #10ns;
    if (sem.try_get(1))
    begin
        sem.put(1);
        $display ("@%0t: key is available", $time);
        break;
    end
end

endtask 