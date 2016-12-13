module Single_cycle_computer(clk);
	input clk;
	reg [31:0] instraction[0:20];
	reg[4:0] PC = 5'b00000;

	reg[31:0] current_inst;
	Execute_inst execute_inst(current_inst,clk);
	initial
		begin
			instraction[0]= 32'b00000000000000010000100000100000;
			instraction[1]= 32'b00000000000000010000100000100000;
			instraction[2]= 32'b00000000000000010000100000100000;
			instraction[3]= 32'b00000000000000010000100000100000;
			// instraction[4]= 32'b00000000000000010000100000100000;
			// instraction[5]= 32'b00000000000000010000100000100000;
			// instraction[6]= 32'b00000000000000010000100000100000;
			// instraction[7]= 32'b00000000000000010000100000100000;
			//sub
			instraction[4]= 32'b00000000001000000000100000100010;
			instraction[5]= 32'b00000000001000000000100000100010;
			instraction[6]= 32'b00000000001000000000100000100100;
			instraction[7]= 32'b00000000001000000000100000100100;
			instraction[8]= 32'b00000000000000010000100000100000;
			instraction[9]= 32'b00000000000000010000100000100000;
			instraction[10]= 32'b00000000000000010000100000100101;
			instraction[11]= 32'b00000000000000010000100000100101;

			//slt
			instraction[12]= 32'b00000000000000010000100000101010;

			//addi
			instraction[13]= 32'b00100000001000010000100000101010;
							  // 00000000000000000000100000101011

			instraction[14]= 32'b00110000001000010000000000101010;
							  // 00000000000000000000000000101010

			instraction[15]= 32'b00110100001000011000000000010101;
							  // 11111111111111111000000000111111
			instraction[16]= 32'b00101000001000010000000000010101;

			instraction[17]= 32'b10101100000000010000000000000001;

			instraction[18]= 32'b00000000000000010000100000100000;

			instraction[19]= 32'b10001100000000010000000000000001;


		end
	always @(posedge clk) begin
		PC = PC + 1;
		$display("Clk posedge PC is %d",PC);
		current_inst = instraction[PC];
	end

	always @(negedge clk) begin
		$display("Clk negedge");
	end
endmodule