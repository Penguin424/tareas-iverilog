primitive UDP_PAB(E, A, B, C, D);
    output E;
    input A, B, C, D;
    table
        //A B C D : E
        0 0 0 0 : 0;
        0 0 0 1 : 0;
        0 0 1 0 : 0;
        0 0 1 1 : 0;
        0 1 0 0 : 0;
        0 1 0 1 : 0; 
        0 1 1 0 : 0;
        0 1 1 1 : 0;
        1 0 0 0 : 0;
        1 0 0 1 : 0;
        1 0 1 0 : 0;
        1 0 1 1 : 0;
        1 1 0 0 : 0;
        1 1 0 1 : 0;
        1 1 1 0 : 0;
        1 1 1 1 : 0;
    endtable
endprimitive

module circuit_udp_pab(E, A, B, C, D);
    output E;
    input A, B, C, D;
    UDP_PAB (E, A, B, C, D);
endmodule

module t_udp_4b;
    wire E;
    reg A, B, C, D;
    circuit_udp_pab C1(E, A, B, C, D);
       initial
        begin
            $monitor(
                "time[%0t]: E:%b, A:%b, B:%b, C:%b, D:%b",
                $time, E, A, B, C, D
            );
            A=1'b0; B=1'b0; C=1'b0; D=1'b0;
            #10 A=1'b0; B=1'b0; C=1'b0; D=1'b1;
            #10 A=1'b0; B=1'b0; C=1'b1; D=1'b1;
            #10 A=1'b0; B=1'b1; C=1'b1; D=1'b1;
            #10 A=1'b1; B=1'b1; C=1'b1; D=1'b1;
        end
endmodule