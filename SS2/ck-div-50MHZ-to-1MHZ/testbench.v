module ck_div_50MHZ_to_5MHZ_tb;
    reg CK50M;
    wire CKOUT;
    ck_div_50MHZ_to_5MHZ uut(.CK50M(CK50M), .CKOUT(CKOUT));

    initial begin
        CK50M = 0;
        forever #10 CK50M = ~CK50M;
    end

    initial begin
        #2000; 
        $finish;
    end
endmodule