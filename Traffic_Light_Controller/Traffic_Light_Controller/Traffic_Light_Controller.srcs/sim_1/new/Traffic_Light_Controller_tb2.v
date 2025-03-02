`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2023 12:17:15 PM
// Design Name: 
// Module Name: Traffic_Light_Controller_tb2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Traffic_Light_Controller_tb2;
// Declare input signals
    reg clk, rst;
    
    // Declare output signals
    wire [2:0] light_M1;
    wire [2:0] light_S;
    wire [2:0] light_MT;
    wire [2:0] light_M2;

    // Instantiate the DUT (Device Under Test)
    Traffic_Light_Controller dut (
        .clk(clk), 
        .rst(rst), 
        .light_M1(light_M1), 
        .light_S(light_S),
        .light_M2(light_M2),
        .light_MT(light_MT)
    );

    // Generate clock signal (1-second period)
    initial begin
        clk = 1'b0;
        forever #500000000 clk = ~clk; // 1s = 1,000,000,000 ns
    end

    // Stimulus process (reset and system testing)
    initial begin
        // Initial reset
        rst = 0;
        #1000000000;  // Wait for 1 second
        rst = 1;      // Apply reset
        #1000000000;  // Keep reset for 1 second
        rst = 0;      // Release reset

        // Run simulation for a sufficient time to cover all states
        #(1000000000 * 50); // Run for 50 seconds

        // Introduce additional reset after 50s to observe behavior
        rst = 1;
        #2000000000;  // Keep reset for 2 seconds
        rst = 0;

        // Continue simulation for another 50 seconds
        #(1000000000 * 50);
        
        $finish; // End simulation
    end
endmodule
