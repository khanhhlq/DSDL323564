module up_down_counter_8bit_tb;
    reg clk = 0, rst, ud, ss;
    wire [7:0] out;
    up_down_counter_8bit uut(.clk(clk), .rst(rst), .ud(ud), .ss(ss), .out(out));

    always #5 clk = ~clk;

    initial begin
        // inital
        rst = 1; ss = 0; ud = 1; #10;
        // UP
        rst = 0; ss = 1; #80;
        // DOWN
        ud = 0; #80;
        // STOP
        ss = 0; #40;
        $finish;
    end
endmodule