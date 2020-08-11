module dado(output [0:6] S, input [2:0] A);

    assign S[0] = (~A[2] & A[1] & ~A[0]) | (~A[2] & A[1] & A[0]) | (A[2] & ~A[1] & ~A[0]) | (A[2] & ~A[1] & A[0]) | (A[2] & A[1] & ~A[0]);
    assign S[1] = (A[2] & ~A[1] & ~A[0]) | (A[2] & ~A[1] & A[0]) | (A[2] & A[1] & ~A[0]);
    assign S[2] = (A[2] & A[1] & ~A[0]);
    assign S[3] = (~A[2] & A[1] & A[0]) | (~A[2] & ~A[1] & A[0]) | (A[2] & ~A[1] & A[0]);
    assign S[4] = S[2];
    assign S[5] = S[1];
    assign S[6] = S[0];

endmodule

module t_dado;
    wire [0:6] S;
    reg [2:0] A;

    dado C1(S, A);

    initial
        begin

            $monitor(
                "(time:%0t): A2:%b A1:%b A0:%b \t a:%b b:%b c:%b d:%b e:%b f:%b g:%b",
                $time, A[2], A[1], A[0], S[0], S[1], S[2], S[3], S[4], S[5], S[6]
            );

            A = 3'b000;

            repeat(7)
                #10 A = A + 3'b001;

        end

endmodule