module ck_div_50MHZ_to_5MHZ_and_1MHZ(input CK50M, speed, output reg CKOUT = 0);

reg [5:0] count = 0;
always @(posedge CK50M) begin
    if (speed == 1'b0) begin
        if (count >= 4) begin
            count <= 0;
            CKOUT <= ~CKOUT;
        end 
        else count <= count + 1;
    end
    else begin
        if (count >= 24) begin
            count <= 0;
            CKOUT <= ~CKOUT;
        end
        else count <= count + 1;
    end
end
endmodule