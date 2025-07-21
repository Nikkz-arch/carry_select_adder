`timescale 1ns / 1ps

module mux2to1(input wire x, input wire y, input wire sel, output wire z);
assign z = sel ? y : x;
endmodule


module carry_select_adder(input [3:0]a,input [3:0]b,output [3:0]sum,input cin,output cout);
wire r1,r2;
wire [7:0]n;
wire p0,p1,p2;
full_adder fa0(.a(a[0]),.b(b[0]),.cin(1'b0),.sum(n[0]),.cout());
full_adder fa1(.a(a[1]),.b(b[1]),.cin(1'b0),.sum(n[1]),.cout());
full_adder fa2(.a(a[2]),.b(b[2]),.cin(1'b0),.sum(n[2]),.cout());
full_adder fa3(.a(a[3]),.b(b[3]),.cin(1'b0),.sum(n[3]),.cout(r1));
full_adder fa4(.a(a[0]),.b(b[0]),.cin(1'b1),.sum(n[4]),.cout());
full_adder fa5(.a(a[1]),.b(b[1]),.cin(1'b1),.sum(n[5]),.cout());
full_adder fa6(.a(a[2]),.b(b[2]),.cin(1'b1),.sum(n[6]),.cout());
full_adder fa7(.a(a[3]),.b(b[3]),.cin(1'b1),.sum(n[7]),.cout(r2));
mux2to1 m0 (.x(r1), .y(r2), .sel(cin), .z(cout));
mux2to1 m1 (.x(n[0]), .y(n[4]), .sel(cin), .z(sum[0]));
mux2to1 m2 (.x(n[1]), .y(n[5]), .sel(cin), .z(sum[1]));
mux2to1 m3 (.x(n[2]), .y(n[6]), .sel(cin), .z(sum[2]));
mux2to1 m4 (.x(n[3]), .y(n[7]), .sel(cin), .z(sum[3]));
endmodule

module full_adder(input a,input b,input cin,output sum,output cout);
assign sum=a^b^cin;
assign cout=a&b|b&cin|cin&a;
endmodule
