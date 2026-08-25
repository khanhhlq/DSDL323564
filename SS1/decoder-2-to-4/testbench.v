module decoder_2_to_4_tb;
    reg [1:0] in;
    reg en, HL; 
    wire[3:0] data_out;
    decoder_2_to_4 dut(in, en, HL, data_out);
    initial begin
        en = 0; #10;

        en = 1; HL = 0; #10;
        in = 2'b00; #10;
        in = 2'b01; #10;
        in = 2'b10; #10;
        in = 2'b11; #10;

        HL = 1;
        in = 2'b00; #10;
        in = 2'b01; #10;
        in = 2'b10; #10;
        in = 2'b11; #10;
    end
endmodule