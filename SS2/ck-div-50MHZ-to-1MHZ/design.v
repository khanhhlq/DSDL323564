module ck_div_50MHZ_to_5MHZ(input CK50M, output reg CKOUT = 0);

reg [5:0] count = 0;
always @(posedge CK50M) begin
    if (count >= 4) begin
        count <= 0;
        CKOUT <= ~CKOUT;
    end 
    else count <= count + 1;
end
endmodule