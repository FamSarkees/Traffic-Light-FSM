module Traffic_Light_tb;

  reg clk;
  reg rst;
  reg [3:0] timer;
  wire [2:0] light;

initial begin
    clk = 0;
    forever #5 clk = ~clk; 
end
  initial begin
    $display("Starting Testbench...");
    $monitor("Time=%0t | rst=%b | timer=%d | light=%b", $time, rst, timer, light);

    rst = 1; 
    timer = 4;
    #10;
    
    rst = 0;

    // State: RED (timer counts down)
    timer = 2; #10;
    timer = 1; #10;
    timer = 0; #10;

    // State should now be GREEN
    timer = 2; #10;
    timer = 1; #10;
    timer = 0; #10;

    // State should now be YELLOW
    timer = 1; #10;
    timer = 0; #10;

    // Back to RED
    timer = 0; #10;

    // Finish
    $display("Testbench finished.");
    $stop;
  end
 Traffic_Light uut (
    .clk(clk), 
    .rst(rst), 
    .timer(timer), 
    .light(light)
  );
endmodule

