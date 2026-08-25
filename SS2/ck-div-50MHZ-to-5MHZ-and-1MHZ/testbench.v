module ck_div_50MHZ_to_5MHZ_and_1MHZ_tb;
    reg CK50M, speed;
    wire CKOUT;
    ck_div_50MHZ_to_5MHZ_and_1MHZ uut(.CK50M(CK50M), .speed(speed), .CKOUT(CKOUT));

    initial begin
        CK50M = 0;
        forever #10 CK50M = ~CK50M;
    end

    initial begin
        speed = 1'b0;
        #2000; 
        speed = 1'b1;
        #6000; 
        $finish;
    end
endmodule