module error_bcd(output Y, input [3:0] A);

    assign Y = A[3] & (A[2] | A[1]);

endmodule

module t_error_bcd;
    wire Y;
    reg [3:0] A;
    
    error_bcd C1(Y, A);

    initial
        begin

            $monitor(
                "(time: %0t) \t %b%b%b%b \t Error:%b",
                $time, A[3], A[2], A[1], A[0], Y
            );

            A = 4'b0000;

            repeat(15)
                #10 A = A + 4'b0001;

        end

endmodule