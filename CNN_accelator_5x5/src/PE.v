module PE 
(
  clk
 ,rst_n
 ,ifm_input0
 ,ifm_input1
 ,ifm_input2
 ,ifm_input3
 ,ifm_input4
 ,wgt_input0
 ,wgt_input1
 ,wgt_input2
 ,wgt_input3
 ,wgt_input4
 ,p_sum
 );
	input clk;
	input rst_n;
  input signed [7:0] ifm_input0; 	
  input signed [7:0] ifm_input1;  
  input signed [7:0] ifm_input2;  
  input signed [7:0] ifm_input3;  
  input signed [7:0] ifm_input4;  
  input signed [7:0] wgt_input0;
  input signed [7:0] wgt_input1;
  input signed [7:0] wgt_input2;
  input signed [7:0] wgt_input3;
  input signed [7:0] wgt_input4;

	output signed [24:0] p_sum;

	reg signed [15:0] product [4:0];
  reg signed [16:0] pp_sum  [2:0] ;
  reg signed [24:0] p_sum;

	integer i;
	integer j;

	always @(posedge clk or negedge rst_n) begin
			if(~rst_n) begin
				for(i = 0 ; i < 5 ; i = i + 1) begin
						product[i] <= 0;
				end
				for(i = 0; i < 3 ; i = i + 1) begin
				  	pp_sum [i] <= 0;
				end
				    p_sum <= 0;
			end
		  else begin			   
            product[0] <= ifm_input0 * wgt_input0;
            product[1] <= ifm_input1 * wgt_input1;
            product[2] <= ifm_input2 * wgt_input2;
            product[3] <= ifm_input3 * wgt_input3;
            product[4] <= ifm_input4 * wgt_input4;
            pp_sum[0]  <= product[0] + product[1];
            pp_sum[1]  <= product[2] + product[3];
            pp_sum[2]  <= product[4];
            p_sum      <= pp_sum[0] + pp_sum[1] + pp_sum[2];
			end
	end
	endmodule








