module mux_4_to_1(
    input [3:0] in, [1:0] sel, 
    input en, HL, 
    output data_out
);
    assign data_out = en ? (HL ? ~in[sel] : in[sel]) : 1'b0;
endmodule