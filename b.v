`timescale 1ns / 1ps

module carry_select_adder_tb;
reg [3:0] a, b;
reg cin;
wire [3:0] sum;
wire cout;
carry_select_adder uut (.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
initial begin
$display("Time\t a\t b\t cin\t|\t sum\t cout");
$monitor("%0t\t %b\t %b\t  %b\t|\t  %b\t   %b", $time, a, b, cin, sum, cout);
a = 4'b0111;
b = 4'b1000;
cin = 1'b0;
#10;
a = 4'b1111;
b = 4'b1111;
cin = 1'b1;
#10;
a = 4'b0000;
b = 4'b0000;
cin = 1'b0;
#10;
$finish;
end
endmodule
