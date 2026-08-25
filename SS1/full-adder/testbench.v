module full_adder_tb;
    reg in1, in2, cin;
    wire sum, cout;

    full_adder fa(.in1(in1), .in2(in2), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        in1 = 0; in2 = 0; cin = 0; #10; 
        in1 = 0; in2 = 0; cin = 1; #10;
        in1 = 0; in2 = 1; cin = 0; #10;
        in1 = 0; in2 = 1; cin = 1; #10;
        in1 = 1; in2 = 0; cin = 0; #10;
        in1 = 1; in2 = 0; cin = 1; #10;
        in1 = 1; in2 = 1; cin = 0; #10;
        in1 = 1; in2 = 1; cin = 1; #10;
    end
endmodule