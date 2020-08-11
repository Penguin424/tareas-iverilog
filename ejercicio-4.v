module sis_seg(a, l, v, p, M, A, L, V, P, S);

    output a, l, v, p;
    input M, A, L, V, P;
    input [5:0] S;
    wire S_o, m, S_M;

    nand(S_o, S[5], S[4], S[3], S[2], S[1], S[0]);
    not(m, M);
    and(S_M, S_o, m);

    assign a = ~A & S_M;
    assign l = ~L & S_M;
    assign v = V & S_M;
    assign p = P & S_M;

endmodule

module t_sis_seg;

    wire a, l, v, d;
    reg M, A, L, V, P;
    reg [5:0] S;

    sis_seg C1(a, l, v, p, M, A, L, V, P, S);

    initial
        begin

            $monitor(
                "\n(time:%0t)\nS5:%b\nS4:%b\nS3:%b\nS2:%b\nS1:%b\nS0:%b\nM:%b\nA:%b\nL:%b\nV:%b\nP:%b\na:%b\nl:%b\nv:%b\np:%b\n",
                $time, S[5], S[4], S[3], S[2], S[1], S[0],
                M, A, L, V, P, a, l, v, p
            );

            S = 6'b111111; M = 0; A = 0; L = 0; V = 0; P = 0;
            #10 S = 6'b011111; M = 1; A = 0; L = 0; V = 0; P = 0;
            #10 S = 6'b011111; M = 0; A = 0; L = 0; V = 0; P = 0;
            #10 S = 6'b011111; M = 0; A = 1; L = 1; V = 1; P = 0;
            #10 S = 6'b000000; M = 0; A = 0; L = 0; V = 1; P = 1;

        end

endmodule