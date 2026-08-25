module half_adder_tb;
    reg a, b;
    wire s, c_out;

    half_adder ha(a, b, s, c_out);

    initial begin
        a = 0; b = 0;
        #100;
        a = 0; b = 1;
        #100;
        a = 1; b = 0;
        #100;
        a = 1; b = 1;
    end
endmodule