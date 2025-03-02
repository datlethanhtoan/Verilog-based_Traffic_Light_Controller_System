`timescale 1ns / 1ps

module Traffic_Light_Controller_tb;
    reg clk, rst;
    
    wire [2:0] light_M1;
    wire [2:0] light_S;
    wire [2:0] light_MT;
    wire [2:0] light_M2;

    Traffic_Light_Controller dut (
        .clk(clk), 
        .rst(rst), 
        .light_M1(light_M1), 
        .light_S(light_S),
        .light_M2(light_M2),
        .light_MT(light_MT)
    );

    initial begin
        clk = 1'b0;
        forever #500000000 clk = ~clk; // 1s = 1,000,000,000 ns
    end

    initial begin
        rst = 0;
        #1000000000;  
        rst = 1;      
        #1000000000;  
        rst = 0;      

        #(1000000000 * 50); 

        rst = 1;
        #2000000000;  
        rst = 0;

        #(1000000000 * 50);
        
        $finish; 
    end

    // Monitor output signals
    initial begin
        $monitor("Time = %0t | light_M1 = %b | light_S = %b | light_MT = %b | light_M2 = %b", 
                 $time, light_M1, light_S, light_MT, light_M2);
    end

endmodule
