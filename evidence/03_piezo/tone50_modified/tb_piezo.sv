`timescale 1ns/1ps
module tb_piezo;
reg clk_50mhz=0,rst_p=1;
wire piezo;
reg previous_piezo=0;
integer cycles,last_cycle=-1,edges=0;
always #10 clk_50mhz=~clk_50mhz;
lab3_piezo #(.CLK_HZ(1000),.TONE_HZ(50)) dut(.clk_50mhz(clk_50mhz),.rst_p(rst_p),.piezo(piezo) );
initial begin
$dumpfile("wave.vcd");$dumpvars(0,tb_piezo);
repeat(3)@(negedge clk_50mhz);rst_p=0;
for(cycles=1;cycles<=25;cycles=cycles+1)begin
@(posedge clk_50mhz);#1;
if(piezo !== ((cycles / 5) % 2 == 1))
    $fatal(1,"cycle=%0d expected=%0d piezo=%b",cycles,(cycles / 5) % 2,piezo);
if(piezo !== previous_piezo)begin
if(last_cycle>=0 && cycles-last_cycle!=5)$fatal(1,"half period=%0d",cycles-last_cycle);
last_cycle=cycles;edges=edges+1;
$display("EDGE cycle=%0d piezo=%b time=%0t",cycles,piezo,$time);
end
previous_piezo=piezo;
end
if(edges!=5)$fatal(1,"too few edges");
$display("LAB3_PIEZO_PASS edges=%0d",edges); $finish;
end
initial begin #5000;$fatal(1,"timeout");end
endmodule
