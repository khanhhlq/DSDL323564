module full_adder(input in1, in2, cin, output sum, cout);
    wire i1, i2, i3;
    half_adder ha1(.a(in1), .b(in2), .s(i1), .cout(i2));
    half_adder ha2(.a(i1), .b(cin), .s(sum), .cout(i3));
    assign cout = i2 | i3;
endmodule

module half_adder(input a, b, output s, cout);
    assign s = a ^ b;
    assign cout = a & b;
endmodule