module two_bit_multiplier_tb();

reg [1:0]A,B;
wire [2:0]S;
wire Co,C;
reg o1,o2,o3,o4;
real passcount=0,failcount=0,n=1;
real pass_percent=0;

two_bit_multiplier dut(.A(A),.B(B),.S(S),.Co(Co),.C(C));

initial begin
assign o1=A[0]&B[0];
assign o2=(A[1]&B[0])^(A[0]&B[1]);
assign o3=(A[1]&B[1])^C;
assign o4=Co;
end

initial begin
repeat(100)
begin
{A,B}=$random;
#1;
$display("The Output is %b%b%b%b for the input A=%b%b and B=%b%b",Co,S[2],S[1],S[0],A[1],A[0],B[1],B[0]);
    if(o1==S[0]&&o2==S[1]&&o3==S[2]&&o4==Co)
    begin
     $display("Test Case Passed");
     passcount=passcount+1;
     $display("passcount=%d\n\n",passcount);
     end
 else
    begin
     $display("Test Case Failed\nThe Failed Inputs are A=%b%b and B=%b%b and the corresponding Outputs for the failed Combinations are %b%b%b%b\n",A[1],A[0],B[1],B[0],Co,S[2],S[1],S[0]);
     failcount=failcount+1;
     $display("failcount=%d\n\n",failcount);
    end
 end
$finish;
pass_percent=passcount*100/(passcount+failcount);
$display("The Pass Percentage is %0.4f percent",pass_percent);

end
endmodule
