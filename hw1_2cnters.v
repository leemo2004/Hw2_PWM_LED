`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/08 16:21:01
// Design Name: 
// Module Name: hw1_2cnters
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


module hw1_2cnters(
    input i_clk,
    input i_rst,
    input [7:0] i_upperBound1,
    input [7:0] i_upperBound2,
    output o_state
    );
    
    reg [7:0] cnt1, cnt2;
    reg state;
    
    assign o_state = state; 
        
    //FSM
    always@(negedge i_rst or posedge i_clk)
    begin
        if(i_rst == 0) 
            state <= 0;
        else
         case (state)
            1'b0 : //counter1 is counting
                if (cnt1 >= i_upperBound1)
                    state <= 1;                
            1'b1 ://counter2 is counting
                if (cnt2 >= i_upperBound2)
                    state <= 0;                
            default : state <= 0;
         endcase

    end //counter1

    //counter1
    always@(negedge i_rst or posedge i_clk)
    begin
        if(i_rst == 0) 
            cnt1 <= 0;
        else
         case (state)
            1'b0 : //counter1 is counting
                cnt1 <= cnt1 + 1;
                //cnt2 <= 0;             
            1'b1 ://counter2 is counting
                cnt1 <= 0;
            default : state <= 0;
         endcase
    end //counter1
    
    //counter2
    always@(negedge i_rst or posedge i_clk)
    begin
        if(i_rst == 0) 
            cnt2 <= 0;
        else
         case (state)
            1'b0 : //counter1 is counting
                cnt2 <= 0;
                //cnt2 <= 0;             
            1'b1 ://counter2 is counting
                cnt2 <= cnt2 + 1;
            default : state <= 0;
         endcase
    end //counter1
endmodule
