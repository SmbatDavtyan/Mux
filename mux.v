module mux_gate(a,b,select,y);
	input a,b,select;
	output y;
	wire i1,i2,i3;
	and U_and1(i1,a,i3);
	and U_and2(i2,b,select);
	not U_not1(i3,select);
	or U_or1(y,i1,i2);
endmodule

module mux_l(a,b,select,y);
	input a,b,select;
	output y;
	wire i1,i2,i3;
	assign y = select ? b: a;	
			
endmodule

module  mux_beh(a,b,select,y);
input a,b,select;
output y;
reg  y;
always @ (select, a , b)
begin
if (select == 0)
begin
#5 y = a;
end
else
begin
#3 y = b ;
end
end
endmodule 

module mux_test;
reg a,b,select;
wire y ;

initial  begin

     $dumpfile ("mux.vcd");
     $dumpvars;
end
mux_beh U_mux(a,b,select,y);
initial
begin
select=0;a=0;b=0;
#100 select=0;
     a=0;
     b=1;
#100 select=0;
     a=1;
     b=0;
#100 select=0;
     a=1;
     b=1;
#100 select=1;
     a=0;
     b=0;
#100 select=1;
     a=0;
     b=1;
#100 select=1;
     a=1; 
     b=0;
#100 select=1;
     a=1;
     b=1;
#100 $finish;
end
initial
begin
$monitor($time,"a=%b,b=%b,select=%b,y=%b",a,b,select,y);
end
endmodule
