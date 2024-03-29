//
//--------------------------------------------------------------------------------
//          THIS FILE WAS AUTOMATICALLY GENERATED BY THE GENESIS2 ENGINE        
//  FOR MORE INFORMATION: OFER SHACHAM (CHIP GENESIS INC / STANFORD VLSI GROUP)
//    !! THIS VERSION OF GENESIS2 IS NOT FOR ANY COMMERCIAL USE !!
//     FOR COMMERCIAL LICENSE CONTACT SHACHAM@ALUMNI.STANFORD.EDU
//--------------------------------------------------------------------------------
//
//  
//	-----------------------------------------------
//	|            Genesis Release Info             |
//	|  $Change: 11904 $ --- $Date: 2013/08/03 $   |
//	-----------------------------------------------
//	
//
//  Source file: /afs/asu.edu/users/j/j/o/jjose3/Lab525/Lab5/convnn/rtl/conv_pool.vp
//  Source template: conv_pool
//
// --------------- Begin Pre-Generation Parameters Status Report ---------------
//
//	From 'generate' statement (priority=5):
//
//		---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
//	From Command Line input (priority=4):
//
//		---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
//	From XML input (priority=3):
//
//		---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
//	From Config File input (priority=2):
//
// ---------------- End Pre-Generation Pramameters Status Report ----------------

//Convolutional Neural Networks Design
// Perl statements with Verilog used
// conv_pool.vp

//Perl initial declaration



// pixelDepth (_GENESIS2_DECLARATION_PRIORITY_) = 8
//
// kernelLength (_GENESIS2_DECLARATION_PRIORITY_) = 3
//
// imageLength (_GENESIS2_DECLARATION_PRIORITY_) = 4
//
// imageBreadth (_GENESIS2_DECLARATION_PRIORITY_) = 4
//

//Module declaration
module conv_pool (clk, image_4x4, shift, conv_kernel, y);
	input logic clk;
	input logic [127:0] image_4x4;
	input logic [71:0] conv_kernel;
	input logic [1:0] shift;
	output logic [7:0] y;
 
logic [127:0] image_4x4_ff;
logic [71:0] conv_kernel_ff;
logic [1:0] shift_ff;
logic [7:0] y_ff;
logic [7:0] x_00;
logic [7:0] x_01;
logic [7:0] x_02;
logic [7:0] x_03;
logic [7:0] x_10;
logic [7:0] x_11;
logic [7:0] x_12;
logic [7:0] x_13;
logic [7:0] x_20;
logic [7:0] x_21;
logic [7:0] x_22;
logic [7:0] x_23;
logic [7:0] x_30;
logic [7:0] x_31;
logic [7:0] x_32;
logic [7:0] x_33;
logic [7:0] k_00;
logic [7:0] k_01;
logic [7:0] k_02;
logic [7:0] k_10;
logic [7:0] k_11;
logic [7:0] k_12;
logic [7:0] k_20;
logic [7:0] k_21;
logic [7:0] k_22;
logic [16:0] c0_00;
logic [16:0] c1_00;
logic [16:0] c2_00;
logic [16:0] c3_00;
logic [16:0] c0_01;
logic [16:0] c1_01;
logic [16:0] c2_01;
logic [16:0] c3_01;
logic [16:0] c0_02;
logic [16:0] c1_02;
logic [16:0] c2_02;
logic [16:0] c3_02;
logic [16:0] c0_10;
logic [16:0] c1_10;
logic [16:0] c2_10;
logic [16:0] c3_10;
logic [16:0] c0_11;
logic [16:0] c1_11;
logic [16:0] c2_11;
logic [16:0] c3_11;
logic [16:0] c0_12;
logic [16:0] c1_12;
logic [16:0] c2_12;
logic [16:0] c3_12;
logic [16:0] c0_20;
logic [16:0] c1_20;
logic [16:0] c2_20;
logic [16:0] c3_20;
logic [16:0] c0_21;
logic [16:0] c1_21;
logic [16:0] c2_21;
logic [16:0] c3_21;
logic [16:0] c0_22;
logic [16:0] c1_22;
logic [16:0] c2_22;
logic [16:0] c3_22;
logic [25:0] c0_sum, c1_sum, c2_sum, c3_sum;
logic [25:0] c0_shft, c1_shft, c2_shft, c3_shft;
logic [7:0] c0_bound, c1_bound, c2_bound, c3_bound;
logic [7:0] y_max1, y_max2, y_max;


assign x_00 = image_4x4_ff[7:0];
assign x_01 = image_4x4_ff[15:8];
assign x_02 = image_4x4_ff[23:16];
assign x_03 = image_4x4_ff[31:24];
assign x_10 = image_4x4_ff[39:32];
assign x_11 = image_4x4_ff[47:40];
assign x_12 = image_4x4_ff[55:48];
assign x_13 = image_4x4_ff[63:56];
assign x_20 = image_4x4_ff[71:64];
assign x_21 = image_4x4_ff[79:72];
assign x_22 = image_4x4_ff[87:80];
assign x_23 = image_4x4_ff[95:88];
assign x_30 = image_4x4_ff[103:96];
assign x_31 = image_4x4_ff[111:104];
assign x_32 = image_4x4_ff[119:112];
assign x_33 = image_4x4_ff[127:120];
assign k_00 = conv_kernel[7:0];
assign k_01 = conv_kernel[15:8];
assign k_02 = conv_kernel[23:16];
assign k_10 = conv_kernel[31:24];
assign k_11 = conv_kernel[39:32];
assign k_12 = conv_kernel[47:40];
assign k_20 = conv_kernel[55:48];
assign k_21 = conv_kernel[63:56];
assign k_22 = conv_kernel[71:64];

assign c0_00 = $signed({1'b0,x_00})*$signed({k_00[7],k_00});
assign c0_01 = $signed({1'b0,x_01})*$signed({k_01[7],k_01});
assign c0_02 = $signed({1'b0,x_02})*$signed({k_02[7],k_02});
assign c0_10 = $signed({1'b0,x_10})*$signed({k_10[7],k_10});
assign c0_11 = $signed({1'b0,x_11})*$signed({k_11[7],k_11});
assign c0_12 = $signed({1'b0,x_12})*$signed({k_12[7],k_12});
assign c0_20 = $signed({1'b0,x_20})*$signed({k_20[7],k_20});
assign c0_21 = $signed({1'b0,x_21})*$signed({k_21[7],k_21});
assign c0_22 = $signed({1'b0,x_22})*$signed({k_22[7],k_22});

assign c1_00 = $signed({1'b0,x_01})*$signed({k_00[7],k_00});
assign c1_01 = $signed({1'b0,x_02})*$signed({k_01[7],k_01});
assign c1_02 = $signed({1'b0,x_03})*$signed({k_02[7],k_02});
assign c1_10 = $signed({1'b0,x_11})*$signed({k_10[7],k_10});
assign c1_11 = $signed({1'b0,x_12})*$signed({k_11[7],k_11});
assign c1_12 = $signed({1'b0,x_13})*$signed({k_12[7],k_12});
assign c1_20 = $signed({1'b0,x_21})*$signed({k_20[7],k_20});
assign c1_21 = $signed({1'b0,x_22})*$signed({k_21[7],k_21});
assign c1_22 = $signed({1'b0,x_23})*$signed({k_22[7],k_22});

assign c2_00 = $signed({1'b0,x_10})*$signed({k_00[7],k_00});
assign c2_01 = $signed({1'b0,x_11})*$signed({k_01[7],k_01});
assign c2_02 = $signed({1'b0,x_12})*$signed({k_02[7],k_02});
assign c2_10 = $signed({1'b0,x_20})*$signed({k_10[7],k_10});
assign c2_11 = $signed({1'b0,x_21})*$signed({k_11[7],k_11});
assign c2_12 = $signed({1'b0,x_22})*$signed({k_12[7],k_12});
assign c2_20 = $signed({1'b0,x_30})*$signed({k_20[7],k_20});
assign c2_21 = $signed({1'b0,x_31})*$signed({k_21[7],k_21});
assign c2_22 = $signed({1'b0,x_32})*$signed({k_22[7],k_22});

assign c3_00 = $signed({1'b0,x_11})*$signed({k_00[7],k_00});
assign c3_01 = $signed({1'b0,x_12})*$signed({k_01[7],k_01});
assign c3_02 = $signed({1'b0,x_13})*$signed({k_02[7],k_02});
assign c3_10 = $signed({1'b0,x_21})*$signed({k_10[7],k_10});
assign c3_11 = $signed({1'b0,x_22})*$signed({k_11[7],k_11});
assign c3_12 = $signed({1'b0,x_23})*$signed({k_12[7],k_12});
assign c3_20 = $signed({1'b0,x_31})*$signed({k_20[7],k_20});
assign c3_21 = $signed({1'b0,x_32})*$signed({k_21[7],k_21});
assign c3_22 = $signed({1'b0,x_33})*$signed({k_22[7],k_22});

//sum of all the convolution
assign c0_sum = $signed(c0_00) + $signed(c0_01) + $signed(c0_02) + $signed(c0_10) + $signed(c0_11) + $signed(c0_12) + $signed(c0_20) + $signed(c0_21) + $signed(c0_22);
assign c1_sum = $signed(c1_00) + $signed(c1_01) + $signed(c1_02) + $signed(c1_10) + $signed(c1_11) + $signed(c1_12) + $signed(c1_20) + $signed(c1_21) + $signed(c1_22);
assign c2_sum = $signed(c2_00) + $signed(c2_01) + $signed(c2_02) + $signed(c2_10) + $signed(c2_11) + $signed(c2_12) + $signed(c2_20) + $signed(c2_21) + $signed(c2_22);
assign c3_sum = $signed(c3_00) + $signed(c3_01) + $signed(c3_02) + $signed(c3_10) + $signed(c3_11) + $signed(c3_12) + $signed(c3_20) + $signed(c3_21) + $signed(c3_22);

//normalize all the convolution
always_comb begin
    case (shift_ff)
        2'b00: c0_shft = c0_sum[25:0];
        2'b01: c0_shft = {c0_sum[25:25],c0_sum[25:1]};
        2'b10: c0_shft = {{2{c0_sum[25:25]}},c0_sum[25:2]};
        2'b11: c0_shft = {{3{c0_sum[25:25]}},c0_sum[25:3]};
    endcase
end

always_comb begin
    case (shift_ff)
        2'b00: c1_shft = c1_sum[25:0];
        2'b01: c1_shft = {c1_sum[25:25],c1_sum[25:1]};
        2'b10: c1_shft = {{2{c1_sum[25:25]}},c1_sum[25:2]};
        2'b11: c1_shft = {{3{c1_sum[25:25]}},c1_sum[25:3]};
    endcase
end

always_comb begin
    case (shift_ff)
        2'b00: c2_shft = c2_sum[25:0];
        2'b01: c2_shft = {c2_sum[25:25],c2_sum[25:1]};
        2'b10: c2_shft = {{2{c2_sum[25:25]}},c2_sum[25:2]};
        2'b11: c2_shft = {{3{c2_sum[25:25]}},c2_sum[25:3]};
    endcase
end

always_comb begin
    case (shift_ff)
        2'b00: c3_shft = c3_sum[25:0];
        2'b01: c3_shft = {c3_sum[25:25],c3_sum[25:1]};
        2'b10: c3_shft = {{2{c3_sum[25:25]}},c3_sum[25:2]};
        2'b11: c3_shft = {{3{c3_sum[25:25]}},c3_sum[25:3]};
    endcase
end

//bound all the normalized convolutions
always_comb begin
    if($signed(c0_shft) < 0) begin
        c0_bound = 8'h00;
    end else if($signed(c0_shft) > 255) begin
        c0_bound = 8'd255;
    end else begin
        c0_bound = c0_shft[7:0];
    end
end

always_comb begin
    if($signed(c1_shft) < 0) begin
        c1_bound = 8'h00;
    end else if($signed(c1_shft) > 255) begin
        c1_bound = 8'd255;
    end else begin
        c1_bound = c1_shft[7:0];
    end
end

always_comb begin
    if($signed(c2_shft) < 0) begin
        c2_bound = 8'h00;
    end else if($signed(c2_shft) > 255) begin
        c2_bound = 8'd255;
    end else begin
        c2_bound = c2_shft[7:0];
    end
end

always_comb begin
    if($signed(c3_shft) < 0) begin
        c3_bound = 8'h00;
    end else if($signed(c3_shft) > 255) begin
        c3_bound = 8'd255;
    end else begin
        c3_bound = c3_shft[7:0];
    end
end

//Find max of all convolutions
always_comb begin
    if(c0_bound > c1_bound) y_max1 = c0_bound;
    else y_max1 = c1_bound;
end

always_comb begin
    if(c2_bound > c3_bound) y_max2 = c2_bound;
    else y_max2 = c3_bound;
end

always_comb begin
    if(y_max2 > y_max1) y_max = y_max2;
    else y_max = y_max1;
end

assign y_ff = y_max;

// Input/Output flops instantiations
dff  D_FLIP_FLOP_IMAGE_4x40 ( .din(image_4x4[0]), .clk, .q(image_4x4_ff[0]) );
dff  D_FLIP_FLOP_IMAGE_4x41 ( .din(image_4x4[1]), .clk, .q(image_4x4_ff[1]) );
dff  D_FLIP_FLOP_IMAGE_4x42 ( .din(image_4x4[2]), .clk, .q(image_4x4_ff[2]) );
dff  D_FLIP_FLOP_IMAGE_4x43 ( .din(image_4x4[3]), .clk, .q(image_4x4_ff[3]) );
dff  D_FLIP_FLOP_IMAGE_4x44 ( .din(image_4x4[4]), .clk, .q(image_4x4_ff[4]) );
dff  D_FLIP_FLOP_IMAGE_4x45 ( .din(image_4x4[5]), .clk, .q(image_4x4_ff[5]) );
dff  D_FLIP_FLOP_IMAGE_4x46 ( .din(image_4x4[6]), .clk, .q(image_4x4_ff[6]) );
dff  D_FLIP_FLOP_IMAGE_4x47 ( .din(image_4x4[7]), .clk, .q(image_4x4_ff[7]) );
dff  D_FLIP_FLOP_IMAGE_4x48 ( .din(image_4x4[8]), .clk, .q(image_4x4_ff[8]) );
dff  D_FLIP_FLOP_IMAGE_4x49 ( .din(image_4x4[9]), .clk, .q(image_4x4_ff[9]) );
dff  D_FLIP_FLOP_IMAGE_4x410 ( .din(image_4x4[10]), .clk, .q(image_4x4_ff[10]) );
dff  D_FLIP_FLOP_IMAGE_4x411 ( .din(image_4x4[11]), .clk, .q(image_4x4_ff[11]) );
dff  D_FLIP_FLOP_IMAGE_4x412 ( .din(image_4x4[12]), .clk, .q(image_4x4_ff[12]) );
dff  D_FLIP_FLOP_IMAGE_4x413 ( .din(image_4x4[13]), .clk, .q(image_4x4_ff[13]) );
dff  D_FLIP_FLOP_IMAGE_4x414 ( .din(image_4x4[14]), .clk, .q(image_4x4_ff[14]) );
dff  D_FLIP_FLOP_IMAGE_4x415 ( .din(image_4x4[15]), .clk, .q(image_4x4_ff[15]) );
dff  D_FLIP_FLOP_IMAGE_4x416 ( .din(image_4x4[16]), .clk, .q(image_4x4_ff[16]) );
dff  D_FLIP_FLOP_IMAGE_4x417 ( .din(image_4x4[17]), .clk, .q(image_4x4_ff[17]) );
dff  D_FLIP_FLOP_IMAGE_4x418 ( .din(image_4x4[18]), .clk, .q(image_4x4_ff[18]) );
dff  D_FLIP_FLOP_IMAGE_4x419 ( .din(image_4x4[19]), .clk, .q(image_4x4_ff[19]) );
dff  D_FLIP_FLOP_IMAGE_4x420 ( .din(image_4x4[20]), .clk, .q(image_4x4_ff[20]) );
dff  D_FLIP_FLOP_IMAGE_4x421 ( .din(image_4x4[21]), .clk, .q(image_4x4_ff[21]) );
dff  D_FLIP_FLOP_IMAGE_4x422 ( .din(image_4x4[22]), .clk, .q(image_4x4_ff[22]) );
dff  D_FLIP_FLOP_IMAGE_4x423 ( .din(image_4x4[23]), .clk, .q(image_4x4_ff[23]) );
dff  D_FLIP_FLOP_IMAGE_4x424 ( .din(image_4x4[24]), .clk, .q(image_4x4_ff[24]) );
dff  D_FLIP_FLOP_IMAGE_4x425 ( .din(image_4x4[25]), .clk, .q(image_4x4_ff[25]) );
dff  D_FLIP_FLOP_IMAGE_4x426 ( .din(image_4x4[26]), .clk, .q(image_4x4_ff[26]) );
dff  D_FLIP_FLOP_IMAGE_4x427 ( .din(image_4x4[27]), .clk, .q(image_4x4_ff[27]) );
dff  D_FLIP_FLOP_IMAGE_4x428 ( .din(image_4x4[28]), .clk, .q(image_4x4_ff[28]) );
dff  D_FLIP_FLOP_IMAGE_4x429 ( .din(image_4x4[29]), .clk, .q(image_4x4_ff[29]) );
dff  D_FLIP_FLOP_IMAGE_4x430 ( .din(image_4x4[30]), .clk, .q(image_4x4_ff[30]) );
dff  D_FLIP_FLOP_IMAGE_4x431 ( .din(image_4x4[31]), .clk, .q(image_4x4_ff[31]) );
dff  D_FLIP_FLOP_IMAGE_4x432 ( .din(image_4x4[32]), .clk, .q(image_4x4_ff[32]) );
dff  D_FLIP_FLOP_IMAGE_4x433 ( .din(image_4x4[33]), .clk, .q(image_4x4_ff[33]) );
dff  D_FLIP_FLOP_IMAGE_4x434 ( .din(image_4x4[34]), .clk, .q(image_4x4_ff[34]) );
dff  D_FLIP_FLOP_IMAGE_4x435 ( .din(image_4x4[35]), .clk, .q(image_4x4_ff[35]) );
dff  D_FLIP_FLOP_IMAGE_4x436 ( .din(image_4x4[36]), .clk, .q(image_4x4_ff[36]) );
dff  D_FLIP_FLOP_IMAGE_4x437 ( .din(image_4x4[37]), .clk, .q(image_4x4_ff[37]) );
dff  D_FLIP_FLOP_IMAGE_4x438 ( .din(image_4x4[38]), .clk, .q(image_4x4_ff[38]) );
dff  D_FLIP_FLOP_IMAGE_4x439 ( .din(image_4x4[39]), .clk, .q(image_4x4_ff[39]) );
dff  D_FLIP_FLOP_IMAGE_4x440 ( .din(image_4x4[40]), .clk, .q(image_4x4_ff[40]) );
dff  D_FLIP_FLOP_IMAGE_4x441 ( .din(image_4x4[41]), .clk, .q(image_4x4_ff[41]) );
dff  D_FLIP_FLOP_IMAGE_4x442 ( .din(image_4x4[42]), .clk, .q(image_4x4_ff[42]) );
dff  D_FLIP_FLOP_IMAGE_4x443 ( .din(image_4x4[43]), .clk, .q(image_4x4_ff[43]) );
dff  D_FLIP_FLOP_IMAGE_4x444 ( .din(image_4x4[44]), .clk, .q(image_4x4_ff[44]) );
dff  D_FLIP_FLOP_IMAGE_4x445 ( .din(image_4x4[45]), .clk, .q(image_4x4_ff[45]) );
dff  D_FLIP_FLOP_IMAGE_4x446 ( .din(image_4x4[46]), .clk, .q(image_4x4_ff[46]) );
dff  D_FLIP_FLOP_IMAGE_4x447 ( .din(image_4x4[47]), .clk, .q(image_4x4_ff[47]) );
dff  D_FLIP_FLOP_IMAGE_4x448 ( .din(image_4x4[48]), .clk, .q(image_4x4_ff[48]) );
dff  D_FLIP_FLOP_IMAGE_4x449 ( .din(image_4x4[49]), .clk, .q(image_4x4_ff[49]) );
dff  D_FLIP_FLOP_IMAGE_4x450 ( .din(image_4x4[50]), .clk, .q(image_4x4_ff[50]) );
dff  D_FLIP_FLOP_IMAGE_4x451 ( .din(image_4x4[51]), .clk, .q(image_4x4_ff[51]) );
dff  D_FLIP_FLOP_IMAGE_4x452 ( .din(image_4x4[52]), .clk, .q(image_4x4_ff[52]) );
dff  D_FLIP_FLOP_IMAGE_4x453 ( .din(image_4x4[53]), .clk, .q(image_4x4_ff[53]) );
dff  D_FLIP_FLOP_IMAGE_4x454 ( .din(image_4x4[54]), .clk, .q(image_4x4_ff[54]) );
dff  D_FLIP_FLOP_IMAGE_4x455 ( .din(image_4x4[55]), .clk, .q(image_4x4_ff[55]) );
dff  D_FLIP_FLOP_IMAGE_4x456 ( .din(image_4x4[56]), .clk, .q(image_4x4_ff[56]) );
dff  D_FLIP_FLOP_IMAGE_4x457 ( .din(image_4x4[57]), .clk, .q(image_4x4_ff[57]) );
dff  D_FLIP_FLOP_IMAGE_4x458 ( .din(image_4x4[58]), .clk, .q(image_4x4_ff[58]) );
dff  D_FLIP_FLOP_IMAGE_4x459 ( .din(image_4x4[59]), .clk, .q(image_4x4_ff[59]) );
dff  D_FLIP_FLOP_IMAGE_4x460 ( .din(image_4x4[60]), .clk, .q(image_4x4_ff[60]) );
dff  D_FLIP_FLOP_IMAGE_4x461 ( .din(image_4x4[61]), .clk, .q(image_4x4_ff[61]) );
dff  D_FLIP_FLOP_IMAGE_4x462 ( .din(image_4x4[62]), .clk, .q(image_4x4_ff[62]) );
dff  D_FLIP_FLOP_IMAGE_4x463 ( .din(image_4x4[63]), .clk, .q(image_4x4_ff[63]) );
dff  D_FLIP_FLOP_IMAGE_4x464 ( .din(image_4x4[64]), .clk, .q(image_4x4_ff[64]) );
dff  D_FLIP_FLOP_IMAGE_4x465 ( .din(image_4x4[65]), .clk, .q(image_4x4_ff[65]) );
dff  D_FLIP_FLOP_IMAGE_4x466 ( .din(image_4x4[66]), .clk, .q(image_4x4_ff[66]) );
dff  D_FLIP_FLOP_IMAGE_4x467 ( .din(image_4x4[67]), .clk, .q(image_4x4_ff[67]) );
dff  D_FLIP_FLOP_IMAGE_4x468 ( .din(image_4x4[68]), .clk, .q(image_4x4_ff[68]) );
dff  D_FLIP_FLOP_IMAGE_4x469 ( .din(image_4x4[69]), .clk, .q(image_4x4_ff[69]) );
dff  D_FLIP_FLOP_IMAGE_4x470 ( .din(image_4x4[70]), .clk, .q(image_4x4_ff[70]) );
dff  D_FLIP_FLOP_IMAGE_4x471 ( .din(image_4x4[71]), .clk, .q(image_4x4_ff[71]) );
dff  D_FLIP_FLOP_IMAGE_4x472 ( .din(image_4x4[72]), .clk, .q(image_4x4_ff[72]) );
dff  D_FLIP_FLOP_IMAGE_4x473 ( .din(image_4x4[73]), .clk, .q(image_4x4_ff[73]) );
dff  D_FLIP_FLOP_IMAGE_4x474 ( .din(image_4x4[74]), .clk, .q(image_4x4_ff[74]) );
dff  D_FLIP_FLOP_IMAGE_4x475 ( .din(image_4x4[75]), .clk, .q(image_4x4_ff[75]) );
dff  D_FLIP_FLOP_IMAGE_4x476 ( .din(image_4x4[76]), .clk, .q(image_4x4_ff[76]) );
dff  D_FLIP_FLOP_IMAGE_4x477 ( .din(image_4x4[77]), .clk, .q(image_4x4_ff[77]) );
dff  D_FLIP_FLOP_IMAGE_4x478 ( .din(image_4x4[78]), .clk, .q(image_4x4_ff[78]) );
dff  D_FLIP_FLOP_IMAGE_4x479 ( .din(image_4x4[79]), .clk, .q(image_4x4_ff[79]) );
dff  D_FLIP_FLOP_IMAGE_4x480 ( .din(image_4x4[80]), .clk, .q(image_4x4_ff[80]) );
dff  D_FLIP_FLOP_IMAGE_4x481 ( .din(image_4x4[81]), .clk, .q(image_4x4_ff[81]) );
dff  D_FLIP_FLOP_IMAGE_4x482 ( .din(image_4x4[82]), .clk, .q(image_4x4_ff[82]) );
dff  D_FLIP_FLOP_IMAGE_4x483 ( .din(image_4x4[83]), .clk, .q(image_4x4_ff[83]) );
dff  D_FLIP_FLOP_IMAGE_4x484 ( .din(image_4x4[84]), .clk, .q(image_4x4_ff[84]) );
dff  D_FLIP_FLOP_IMAGE_4x485 ( .din(image_4x4[85]), .clk, .q(image_4x4_ff[85]) );
dff  D_FLIP_FLOP_IMAGE_4x486 ( .din(image_4x4[86]), .clk, .q(image_4x4_ff[86]) );
dff  D_FLIP_FLOP_IMAGE_4x487 ( .din(image_4x4[87]), .clk, .q(image_4x4_ff[87]) );
dff  D_FLIP_FLOP_IMAGE_4x488 ( .din(image_4x4[88]), .clk, .q(image_4x4_ff[88]) );
dff  D_FLIP_FLOP_IMAGE_4x489 ( .din(image_4x4[89]), .clk, .q(image_4x4_ff[89]) );
dff  D_FLIP_FLOP_IMAGE_4x490 ( .din(image_4x4[90]), .clk, .q(image_4x4_ff[90]) );
dff  D_FLIP_FLOP_IMAGE_4x491 ( .din(image_4x4[91]), .clk, .q(image_4x4_ff[91]) );
dff  D_FLIP_FLOP_IMAGE_4x492 ( .din(image_4x4[92]), .clk, .q(image_4x4_ff[92]) );
dff  D_FLIP_FLOP_IMAGE_4x493 ( .din(image_4x4[93]), .clk, .q(image_4x4_ff[93]) );
dff  D_FLIP_FLOP_IMAGE_4x494 ( .din(image_4x4[94]), .clk, .q(image_4x4_ff[94]) );
dff  D_FLIP_FLOP_IMAGE_4x495 ( .din(image_4x4[95]), .clk, .q(image_4x4_ff[95]) );
dff  D_FLIP_FLOP_IMAGE_4x496 ( .din(image_4x4[96]), .clk, .q(image_4x4_ff[96]) );
dff  D_FLIP_FLOP_IMAGE_4x497 ( .din(image_4x4[97]), .clk, .q(image_4x4_ff[97]) );
dff  D_FLIP_FLOP_IMAGE_4x498 ( .din(image_4x4[98]), .clk, .q(image_4x4_ff[98]) );
dff  D_FLIP_FLOP_IMAGE_4x499 ( .din(image_4x4[99]), .clk, .q(image_4x4_ff[99]) );
dff  D_FLIP_FLOP_IMAGE_4x4100 ( .din(image_4x4[100]), .clk, .q(image_4x4_ff[100]) );
dff  D_FLIP_FLOP_IMAGE_4x4101 ( .din(image_4x4[101]), .clk, .q(image_4x4_ff[101]) );
dff  D_FLIP_FLOP_IMAGE_4x4102 ( .din(image_4x4[102]), .clk, .q(image_4x4_ff[102]) );
dff  D_FLIP_FLOP_IMAGE_4x4103 ( .din(image_4x4[103]), .clk, .q(image_4x4_ff[103]) );
dff  D_FLIP_FLOP_IMAGE_4x4104 ( .din(image_4x4[104]), .clk, .q(image_4x4_ff[104]) );
dff  D_FLIP_FLOP_IMAGE_4x4105 ( .din(image_4x4[105]), .clk, .q(image_4x4_ff[105]) );
dff  D_FLIP_FLOP_IMAGE_4x4106 ( .din(image_4x4[106]), .clk, .q(image_4x4_ff[106]) );
dff  D_FLIP_FLOP_IMAGE_4x4107 ( .din(image_4x4[107]), .clk, .q(image_4x4_ff[107]) );
dff  D_FLIP_FLOP_IMAGE_4x4108 ( .din(image_4x4[108]), .clk, .q(image_4x4_ff[108]) );
dff  D_FLIP_FLOP_IMAGE_4x4109 ( .din(image_4x4[109]), .clk, .q(image_4x4_ff[109]) );
dff  D_FLIP_FLOP_IMAGE_4x4110 ( .din(image_4x4[110]), .clk, .q(image_4x4_ff[110]) );
dff  D_FLIP_FLOP_IMAGE_4x4111 ( .din(image_4x4[111]), .clk, .q(image_4x4_ff[111]) );
dff  D_FLIP_FLOP_IMAGE_4x4112 ( .din(image_4x4[112]), .clk, .q(image_4x4_ff[112]) );
dff  D_FLIP_FLOP_IMAGE_4x4113 ( .din(image_4x4[113]), .clk, .q(image_4x4_ff[113]) );
dff  D_FLIP_FLOP_IMAGE_4x4114 ( .din(image_4x4[114]), .clk, .q(image_4x4_ff[114]) );
dff  D_FLIP_FLOP_IMAGE_4x4115 ( .din(image_4x4[115]), .clk, .q(image_4x4_ff[115]) );
dff  D_FLIP_FLOP_IMAGE_4x4116 ( .din(image_4x4[116]), .clk, .q(image_4x4_ff[116]) );
dff  D_FLIP_FLOP_IMAGE_4x4117 ( .din(image_4x4[117]), .clk, .q(image_4x4_ff[117]) );
dff  D_FLIP_FLOP_IMAGE_4x4118 ( .din(image_4x4[118]), .clk, .q(image_4x4_ff[118]) );
dff  D_FLIP_FLOP_IMAGE_4x4119 ( .din(image_4x4[119]), .clk, .q(image_4x4_ff[119]) );
dff  D_FLIP_FLOP_IMAGE_4x4120 ( .din(image_4x4[120]), .clk, .q(image_4x4_ff[120]) );
dff  D_FLIP_FLOP_IMAGE_4x4121 ( .din(image_4x4[121]), .clk, .q(image_4x4_ff[121]) );
dff  D_FLIP_FLOP_IMAGE_4x4122 ( .din(image_4x4[122]), .clk, .q(image_4x4_ff[122]) );
dff  D_FLIP_FLOP_IMAGE_4x4123 ( .din(image_4x4[123]), .clk, .q(image_4x4_ff[123]) );
dff  D_FLIP_FLOP_IMAGE_4x4124 ( .din(image_4x4[124]), .clk, .q(image_4x4_ff[124]) );
dff  D_FLIP_FLOP_IMAGE_4x4125 ( .din(image_4x4[125]), .clk, .q(image_4x4_ff[125]) );
dff  D_FLIP_FLOP_IMAGE_4x4126 ( .din(image_4x4[126]), .clk, .q(image_4x4_ff[126]) );
dff  D_FLIP_FLOP_IMAGE_4x4127 ( .din(image_4x4[127]), .clk, .q(image_4x4_ff[127]) );
dff  D_FLIP_FLOP_CONV_KERNEL0 ( .din(conv_kernel[0]), .clk, .q(conv_kernel_ff[0]) );
dff  D_FLIP_FLOP_CONV_KERNEL1 ( .din(conv_kernel[1]), .clk, .q(conv_kernel_ff[1]) );
dff  D_FLIP_FLOP_CONV_KERNEL2 ( .din(conv_kernel[2]), .clk, .q(conv_kernel_ff[2]) );
dff  D_FLIP_FLOP_CONV_KERNEL3 ( .din(conv_kernel[3]), .clk, .q(conv_kernel_ff[3]) );
dff  D_FLIP_FLOP_CONV_KERNEL4 ( .din(conv_kernel[4]), .clk, .q(conv_kernel_ff[4]) );
dff  D_FLIP_FLOP_CONV_KERNEL5 ( .din(conv_kernel[5]), .clk, .q(conv_kernel_ff[5]) );
dff  D_FLIP_FLOP_CONV_KERNEL6 ( .din(conv_kernel[6]), .clk, .q(conv_kernel_ff[6]) );
dff  D_FLIP_FLOP_CONV_KERNEL7 ( .din(conv_kernel[7]), .clk, .q(conv_kernel_ff[7]) );
dff  D_FLIP_FLOP_CONV_KERNEL8 ( .din(conv_kernel[8]), .clk, .q(conv_kernel_ff[8]) );
dff  D_FLIP_FLOP_CONV_KERNEL9 ( .din(conv_kernel[9]), .clk, .q(conv_kernel_ff[9]) );
dff  D_FLIP_FLOP_CONV_KERNEL10 ( .din(conv_kernel[10]), .clk, .q(conv_kernel_ff[10]) );
dff  D_FLIP_FLOP_CONV_KERNEL11 ( .din(conv_kernel[11]), .clk, .q(conv_kernel_ff[11]) );
dff  D_FLIP_FLOP_CONV_KERNEL12 ( .din(conv_kernel[12]), .clk, .q(conv_kernel_ff[12]) );
dff  D_FLIP_FLOP_CONV_KERNEL13 ( .din(conv_kernel[13]), .clk, .q(conv_kernel_ff[13]) );
dff  D_FLIP_FLOP_CONV_KERNEL14 ( .din(conv_kernel[14]), .clk, .q(conv_kernel_ff[14]) );
dff  D_FLIP_FLOP_CONV_KERNEL15 ( .din(conv_kernel[15]), .clk, .q(conv_kernel_ff[15]) );
dff  D_FLIP_FLOP_CONV_KERNEL16 ( .din(conv_kernel[16]), .clk, .q(conv_kernel_ff[16]) );
dff  D_FLIP_FLOP_CONV_KERNEL17 ( .din(conv_kernel[17]), .clk, .q(conv_kernel_ff[17]) );
dff  D_FLIP_FLOP_CONV_KERNEL18 ( .din(conv_kernel[18]), .clk, .q(conv_kernel_ff[18]) );
dff  D_FLIP_FLOP_CONV_KERNEL19 ( .din(conv_kernel[19]), .clk, .q(conv_kernel_ff[19]) );
dff  D_FLIP_FLOP_CONV_KERNEL20 ( .din(conv_kernel[20]), .clk, .q(conv_kernel_ff[20]) );
dff  D_FLIP_FLOP_CONV_KERNEL21 ( .din(conv_kernel[21]), .clk, .q(conv_kernel_ff[21]) );
dff  D_FLIP_FLOP_CONV_KERNEL22 ( .din(conv_kernel[22]), .clk, .q(conv_kernel_ff[22]) );
dff  D_FLIP_FLOP_CONV_KERNEL23 ( .din(conv_kernel[23]), .clk, .q(conv_kernel_ff[23]) );
dff  D_FLIP_FLOP_CONV_KERNEL24 ( .din(conv_kernel[24]), .clk, .q(conv_kernel_ff[24]) );
dff  D_FLIP_FLOP_CONV_KERNEL25 ( .din(conv_kernel[25]), .clk, .q(conv_kernel_ff[25]) );
dff  D_FLIP_FLOP_CONV_KERNEL26 ( .din(conv_kernel[26]), .clk, .q(conv_kernel_ff[26]) );
dff  D_FLIP_FLOP_CONV_KERNEL27 ( .din(conv_kernel[27]), .clk, .q(conv_kernel_ff[27]) );
dff  D_FLIP_FLOP_CONV_KERNEL28 ( .din(conv_kernel[28]), .clk, .q(conv_kernel_ff[28]) );
dff  D_FLIP_FLOP_CONV_KERNEL29 ( .din(conv_kernel[29]), .clk, .q(conv_kernel_ff[29]) );
dff  D_FLIP_FLOP_CONV_KERNEL30 ( .din(conv_kernel[30]), .clk, .q(conv_kernel_ff[30]) );
dff  D_FLIP_FLOP_CONV_KERNEL31 ( .din(conv_kernel[31]), .clk, .q(conv_kernel_ff[31]) );
dff  D_FLIP_FLOP_CONV_KERNEL32 ( .din(conv_kernel[32]), .clk, .q(conv_kernel_ff[32]) );
dff  D_FLIP_FLOP_CONV_KERNEL33 ( .din(conv_kernel[33]), .clk, .q(conv_kernel_ff[33]) );
dff  D_FLIP_FLOP_CONV_KERNEL34 ( .din(conv_kernel[34]), .clk, .q(conv_kernel_ff[34]) );
dff  D_FLIP_FLOP_CONV_KERNEL35 ( .din(conv_kernel[35]), .clk, .q(conv_kernel_ff[35]) );
dff  D_FLIP_FLOP_CONV_KERNEL36 ( .din(conv_kernel[36]), .clk, .q(conv_kernel_ff[36]) );
dff  D_FLIP_FLOP_CONV_KERNEL37 ( .din(conv_kernel[37]), .clk, .q(conv_kernel_ff[37]) );
dff  D_FLIP_FLOP_CONV_KERNEL38 ( .din(conv_kernel[38]), .clk, .q(conv_kernel_ff[38]) );
dff  D_FLIP_FLOP_CONV_KERNEL39 ( .din(conv_kernel[39]), .clk, .q(conv_kernel_ff[39]) );
dff  D_FLIP_FLOP_CONV_KERNEL40 ( .din(conv_kernel[40]), .clk, .q(conv_kernel_ff[40]) );
dff  D_FLIP_FLOP_CONV_KERNEL41 ( .din(conv_kernel[41]), .clk, .q(conv_kernel_ff[41]) );
dff  D_FLIP_FLOP_CONV_KERNEL42 ( .din(conv_kernel[42]), .clk, .q(conv_kernel_ff[42]) );
dff  D_FLIP_FLOP_CONV_KERNEL43 ( .din(conv_kernel[43]), .clk, .q(conv_kernel_ff[43]) );
dff  D_FLIP_FLOP_CONV_KERNEL44 ( .din(conv_kernel[44]), .clk, .q(conv_kernel_ff[44]) );
dff  D_FLIP_FLOP_CONV_KERNEL45 ( .din(conv_kernel[45]), .clk, .q(conv_kernel_ff[45]) );
dff  D_FLIP_FLOP_CONV_KERNEL46 ( .din(conv_kernel[46]), .clk, .q(conv_kernel_ff[46]) );
dff  D_FLIP_FLOP_CONV_KERNEL47 ( .din(conv_kernel[47]), .clk, .q(conv_kernel_ff[47]) );
dff  D_FLIP_FLOP_CONV_KERNEL48 ( .din(conv_kernel[48]), .clk, .q(conv_kernel_ff[48]) );
dff  D_FLIP_FLOP_CONV_KERNEL49 ( .din(conv_kernel[49]), .clk, .q(conv_kernel_ff[49]) );
dff  D_FLIP_FLOP_CONV_KERNEL50 ( .din(conv_kernel[50]), .clk, .q(conv_kernel_ff[50]) );
dff  D_FLIP_FLOP_CONV_KERNEL51 ( .din(conv_kernel[51]), .clk, .q(conv_kernel_ff[51]) );
dff  D_FLIP_FLOP_CONV_KERNEL52 ( .din(conv_kernel[52]), .clk, .q(conv_kernel_ff[52]) );
dff  D_FLIP_FLOP_CONV_KERNEL53 ( .din(conv_kernel[53]), .clk, .q(conv_kernel_ff[53]) );
dff  D_FLIP_FLOP_CONV_KERNEL54 ( .din(conv_kernel[54]), .clk, .q(conv_kernel_ff[54]) );
dff  D_FLIP_FLOP_CONV_KERNEL55 ( .din(conv_kernel[55]), .clk, .q(conv_kernel_ff[55]) );
dff  D_FLIP_FLOP_CONV_KERNEL56 ( .din(conv_kernel[56]), .clk, .q(conv_kernel_ff[56]) );
dff  D_FLIP_FLOP_CONV_KERNEL57 ( .din(conv_kernel[57]), .clk, .q(conv_kernel_ff[57]) );
dff  D_FLIP_FLOP_CONV_KERNEL58 ( .din(conv_kernel[58]), .clk, .q(conv_kernel_ff[58]) );
dff  D_FLIP_FLOP_CONV_KERNEL59 ( .din(conv_kernel[59]), .clk, .q(conv_kernel_ff[59]) );
dff  D_FLIP_FLOP_CONV_KERNEL60 ( .din(conv_kernel[60]), .clk, .q(conv_kernel_ff[60]) );
dff  D_FLIP_FLOP_CONV_KERNEL61 ( .din(conv_kernel[61]), .clk, .q(conv_kernel_ff[61]) );
dff  D_FLIP_FLOP_CONV_KERNEL62 ( .din(conv_kernel[62]), .clk, .q(conv_kernel_ff[62]) );
dff  D_FLIP_FLOP_CONV_KERNEL63 ( .din(conv_kernel[63]), .clk, .q(conv_kernel_ff[63]) );
dff  D_FLIP_FLOP_CONV_KERNEL64 ( .din(conv_kernel[64]), .clk, .q(conv_kernel_ff[64]) );
dff  D_FLIP_FLOP_CONV_KERNEL65 ( .din(conv_kernel[65]), .clk, .q(conv_kernel_ff[65]) );
dff  D_FLIP_FLOP_CONV_KERNEL66 ( .din(conv_kernel[66]), .clk, .q(conv_kernel_ff[66]) );
dff  D_FLIP_FLOP_CONV_KERNEL67 ( .din(conv_kernel[67]), .clk, .q(conv_kernel_ff[67]) );
dff  D_FLIP_FLOP_CONV_KERNEL68 ( .din(conv_kernel[68]), .clk, .q(conv_kernel_ff[68]) );
dff  D_FLIP_FLOP_CONV_KERNEL69 ( .din(conv_kernel[69]), .clk, .q(conv_kernel_ff[69]) );
dff  D_FLIP_FLOP_CONV_KERNEL70 ( .din(conv_kernel[70]), .clk, .q(conv_kernel_ff[70]) );
dff  D_FLIP_FLOP_CONV_KERNEL71 ( .din(conv_kernel[71]), .clk, .q(conv_kernel_ff[71]) );
dff  D_FLIP_FLOP_SHIFT0 ( .din(shift[0]), .clk, .q(shift_ff[0]) );
dff  D_FLIP_FLOP_SHIFT1 ( .din(shift[1]), .clk, .q(shift_ff[1]) );
dff  D_FLIP_FLOP_Y0 ( .din(y_ff[0]), .clk, .q(y[0]) );
dff  D_FLIP_FLOP_Y1 ( .din(y_ff[1]), .clk, .q(y[1]) );
dff  D_FLIP_FLOP_Y2 ( .din(y_ff[2]), .clk, .q(y[2]) );
dff  D_FLIP_FLOP_Y3 ( .din(y_ff[3]), .clk, .q(y[3]) );
dff  D_FLIP_FLOP_Y4 ( .din(y_ff[4]), .clk, .q(y[4]) );
dff  D_FLIP_FLOP_Y5 ( .din(y_ff[5]), .clk, .q(y[5]) );
dff  D_FLIP_FLOP_Y6 ( .din(y_ff[6]), .clk, .q(y[6]) );
dff  D_FLIP_FLOP_Y7 ( .din(y_ff[7]), .clk, .q(y[7]) );


endmodule: conv_pool
