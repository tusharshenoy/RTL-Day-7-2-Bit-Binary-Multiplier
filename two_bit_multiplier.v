//Verilog Code for Two BIT Multiplier
module two_bit_multiplier(A,B,S,Co,C);
input [1:0]A,B;
output [2:0]S;
output Co,C;

//For AoBo Output
andgate a1(A[0],B[0],S[0]); /*we can also use built in AND gate Primitives*/

//For A1Bo+AoB1 Output
wire w1,w2,w3,w4;
andgate a2(A[1],B[0],w1);  /*we can also use built in AND gate Primitives*/
andgate a3(A[0],B[1],w2); /*we can also use built in AND gate Primitives*/
halfadder h1(w1,w2,S[1],C);

//For A1B1 Output
andgate a4(A[1],B[1],w3);  /*we can also use built in AND gate Primitives*/
halfadder h2(w3,C,S[2],Co);
endmodule
