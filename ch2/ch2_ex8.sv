module ch2_ex8;

initial begin

int sum;
byte min[$], max[$];
int a_neg[$];
int a_pos[$];
byte a[$];
a= {2,-1,127};


sum = a.sum() with (int'(item));
$display("sum = %0d", sum);


min = a.min();
$display("min = %0d", min);
max = a.max();
$display("max = %0d", max);

a.sort();
foreach (a[i])
  $display("sort: a[%0d] = %0d", i, a[i]);


a_neg = a.find_index with (item < 0);
foreach (a_neg[i])
  $display("neg index = %0d", a_neg[i]);



a_pos = a.find_index with (item > 0);
foreach (a_pos[i])
  $display("pos values = %0d", a[a_pos[i]]);


a.reverse();
foreach (a[i])
  $display("reverse order = a[%0d] = %0d", i, a[i]);


end

endmodule 