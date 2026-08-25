module up_down_counter_8bit(
    input clk, rst, ud, ss, 
    output reg [7:0] out
);
    always @(posedge clk or posedge rst) begin
        if (rst) out <= 8'b0000_0000;
        else begin
            if (ss) begin
                if (ud) out <= out + 8'b0000_0001; 
                else out <= out - 8'b0000_0001;
            end 
            else out <= out;
        end
    end
endmodule