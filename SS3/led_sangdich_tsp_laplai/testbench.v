module led_sangdich_tsp_laplai_tb;
    reg clk = 0, reset;
    wire [7:0] led;

    led_sangdich_tsp_laplai uut(.clk(clk), .reset(reset), .led(led));

    always #5 clk = ~clk;
    initial begin
        reset = 1;
        #10;
        reset = 0;
        #200;
        $finish;
    end
endmodule