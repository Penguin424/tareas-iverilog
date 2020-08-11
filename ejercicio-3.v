module sum_2b(output S, C, input [1:0] AB);
    or(S, AB[0], AB[1]);
    and(C, AB[0], AB[1]);
endmodule

module t_sum_2b;
    wire S, C;
    reg [1:0] AB;

    sum_2b S1(S, C, AB);

    initial 
        begin
            $monitor(
                "(Time: %0t): AB1= %b AB0= %b S= %b C= %b",
                $time, AB[1], AB[0], S, C
            );
            
            AB = 2'b00;

            repeat(3)
                #10 AB = AB + 2'b01;

        end
endmodule