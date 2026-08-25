module decoder_2_to_4(input [1:0] in, input en, HL, output [3:0] data_out);
    reg [3:0] temp;
    always @(*)
    begin
        if (en)
        begin 
            if (in == 2'b00) temp = 4'b0001;
            else if (in == 2'b01) temp = 4'b0010;
            else if (in == 2'b10) temp = 4'b0100;
            else if (in == 2'b11) temp = 4'b1000;
            else temp = 4'b0000;
        end
        else temp = 4'b0000;
    end
    assign data_out = (HL == 1'b0) ? temp : ~temp;
endmodule