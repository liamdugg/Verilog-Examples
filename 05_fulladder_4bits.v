module fulladder_4bits (
	input  [0:3] a,
	input  [0:3] b,
	input  		 ci,
	output [0:3] s,
	output 		 co3 );

	wire co0, co1, co2, co3;

	fulladder_1bit fa0(a[0], b[0], ci, s[0], co0);
	fulladder_1bit fa0(a[1], b[1], ci, s[1], co1);
	fulladder_1bit fa0(a[2], b[2], ci, s[2], co2);
	fulladder_1bit fa0(a[3], b[3], ci, s[3], co3);

endmodule

// otra forma de hacerlo con conexiónes nombradas
// no se entiende mucho para que
// module fulladder4(
// 	input  [3:0] a,
// 	input  [3:0] b,
// 	input 	     cin,
// 	output [3:0] s,
// 	output       cout4 );
// 	
// 	wire cout1,cout2,cout3;
// 	
// 	fulladder fa0 (.a(a[0]), .b(b[0]), .cin(cin), .s(s[0]), .cout(cout1));
// 	fulladder fa1 (.a(a[1]), .b(b[1]), .cin(cout1), .s(s[1]), .cout(cout2));
// 	fulladder fa2 (.a(a[2]), .b(b[2]), .cin(cout2), .s(s[2]), .cout(cout3));
// 	fulladder fa3 (.a(a[3]), .b(b[3]), .cin(cout3), .s(s[3]), .cout(cout4));
// endmodule