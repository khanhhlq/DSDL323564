module mux_4_to_1_tb;
    reg [3:0] in;
    reg [1:0] sel;
    reg en, HL;
    wire data_out;

    mux_4_to_1 dut(in, sel, en, HL, data_out);

    initial begin
        in = 4'b1010;

        en = 0; HL = 0; sel = 0; #10;

        en = 1; HL = 0;
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        HL = 1;
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        $finish;
    end

endmodule