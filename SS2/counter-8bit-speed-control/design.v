module DEM_8bit(
    input clk, speed, reset, UD, SS,
    output reg [7:0] out = 0
);

    reg [5:0] count = 0;
    reg clk_div = 0;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
            clk_div <= 0;
        end else begin
            if (speed == 1'b0) begin
                if (count >= 4) begin
                    count <= 0;
                    clk_div <= ~clk_div;
                end else begin
                    count <= count + 1;
                end
            end else begin
                if (count >= 24) begin
                    count <= 0;
                    clk_div <= ~clk_div;
                end else begin
                    count <= count + 1;
                end
            end
        end
    end

    always @(posedge clk_div or posedge reset) begin
        if (reset) begin
            out <= 8'd0;
        end else if (SS == 1'b1) begin
            if (UD == 1'b1) begin
                out <= out + 1; 
            end else begin
                out <= out - 1;
            end
        end
    end
endmodule