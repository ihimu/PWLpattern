% A7 = "PWL(";
% A6 = "PWL(";
% A5 = "PWL(";
% A4 = "PWL(";
% A3 = "PWL(";
% A2 = "PWL(";
% A1 = "PWL(";
% A0 = "PWL(";
% 
% B7 = "PWL(";
% B6 = "PWL(";
% B5 = "PWL(";
% B4 = "PWL(";
% B3 = "PWL(";
% B2 = "PWL(";
% B1 = "PWL(";
% B0 = "PWL(";
% 
% Cin = "PWL(";
mkdir PWLsrcs
A7 = fopen( 'PWLsrcs/A7.txt', 'wt' );
A6 = fopen( 'PWLsrcs/A6.txt', 'wt' );
A5 = fopen( 'PWLsrcs/A5.txt', 'wt' );
A4 = fopen( 'PWLsrcs/A4.txt', 'wt' );
A3 = fopen( 'PWLsrcs/A3.txt', 'wt' );
A2 = fopen( 'PWLsrcs/A2.txt', 'wt' );
A1 = fopen( 'PWLsrcs/A1.txt', 'wt' );
A0 = fopen( 'PWLsrcs/A0.txt', 'wt' );

B7 = fopen( 'PWLsrcs/B7.txt', 'wt' );
B6 = fopen( 'PWLsrcs/B6.txt', 'wt' );
B5 = fopen( 'PWLsrcs/B5.txt', 'wt' );
B4 = fopen( 'PWLsrcs/B4.txt', 'wt' );
B3 = fopen( 'PWLsrcs/B3.txt', 'wt' );
B2 = fopen( 'PWLsrcs/B2.txt', 'wt' );
B1 = fopen( 'PWLsrcs/B1.txt', 'wt' );
B0 = fopen( 'PWLsrcs/B0.txt', 'wt' );

Cin = fopen('PWLsrcs/Cin.txt', 'wt' );


size = 10; %number of Test vectors
rise_time = 1; %in ps
del = 270; %in ps

a_vals  = randi(256,1,size)-1;
b_vals  = randi(256,1,size)-1;
c_vals = randi(2,1,size)-1;

%a_vals = [255 255 255 255 255 255 255 255 255 255];
%b_vals = [0 1 0 1 0 1 0 1 0 1];
%c_vals = [0 0 0 0 0 0 0 0 0 0 ];

% a_vals = [255 255 255 255 255 255 255 255 255 255];
% b_vals = [5 0 5 0 5 0 5 0 5 0 ];
% c_vals = [0 0 0 0 0 0 0 0 0 0];

%a_vals = [255 255 255 255 255 255 255 255 255 255];
%b_vals = [255 0 255 0 255 0 255 0 255 0];
%c_vals = [0 1 0 1 0 1 0 1 0 1 ];

sum_vals = a_vals+b_vals+c_vals;
sum_vals_bin = dec2bin(sum_vals, 9);

for i=1:size-1
    fprintf('T=%d\tCin=%d\tA=%d\tB=%d\t SUM=%d \t[%s]\n', i*del, c_vals(i), a_vals(i), b_vals(i),sum_vals(i), sum_vals_bin(i,:) )
    
    a_dec_bef = a_vals(i);
    a_bef = dec2bin(a_dec_bef, 8);
    b_dec_bef = b_vals(i);
    b_bef = dec2bin(b_dec_bef, 8);
    c_dec_bef = c_vals(i);
    c_bef = dec2bin(c_dec_bef, 1);

    a_dec = a_vals(i+1);
    a = dec2bin(a_dec, 8);
    b_dec = b_vals(i+1);
    b = dec2bin(b_dec, 8);
    c_dec = c_vals(i+1);
    c = dec2bin(c_dec, 1);
    
    t_bef= strcat(string(i*del-rise_time),"p");
    t= strcat(string(i*del),"p");

    fprintf(A0, '%s %s\n%s %s\n',t_bef, a_bef(8), t, a(8) );
    fprintf(A1, '%s %s\n%s %s\n',t_bef, a_bef(7), t, a(7) );
    fprintf(A2, '%s %s\n%s %s\n',t_bef, a_bef(6), t, a(6) );
    fprintf(A3, '%s %s\n%s %s\n',t_bef, a_bef(5), t, a(5) );
    fprintf(A4, '%s %s\n%s %s\n',t_bef, a_bef(4), t, a(4) );
    fprintf(A5, '%s %s\n%s %s\n',t_bef, a_bef(3), t, a(3) );
    fprintf(A6, '%s %s\n%s %s\n',t_bef, a_bef(2), t, a(2) );
    fprintf(A7, '%s %s\n%s %s\n',t_bef, a_bef(1), t, a(1) );

    fprintf(Cin, '%s %s\n%s %s\n',t_bef, c_bef(1), t, c(1) );

    fprintf(B0, '%s %s\n%s %s\n',t_bef, b_bef(8), t, b(8) );
    fprintf(B1, '%s %s\n%s %s\n',t_bef, b_bef(7), t, b(7) );
    fprintf(B2, '%s %s\n%s %s\n',t_bef, b_bef(6), t, b(6) );
    fprintf(B3, '%s %s\n%s %s\n',t_bef, b_bef(5), t, b(5) );
    fprintf(B4, '%s %s\n%s %s\n',t_bef, b_bef(4), t, b(4) );
    fprintf(B5, '%s %s\n%s %s\n',t_bef, b_bef(3), t, b(3) );
    fprintf(B6, '%s %s\n%s %s\n',t_bef, b_bef(2), t, b(2) );
    fprintf(B7, '%s %s\n%s %s\n',t_bef, b_bef(1), t, b(1) );

    

%     A7 = strcat(A7,t_bef, " ", a_bef(8), " ");
%     A6 = strcat(A6,t_bef, " ", a_bef(7), " ");
%     A5 = strcat(A5,t_bef, " ", a_bef(6), " ");
%     A4 = strcat(A4,t_bef, " ", a_bef(5), " ");
%     A3 = strcat(A3,t_bef, " ", a_bef(4), " ");
%     A2 = strcat(A2,t_bef, " ", a_bef(3), " ");
%     A1 = strcat(A1,t_bef, " ", a_bef(2), " ");
%     A0 = strcat(A0,t_bef, " ", a_bef(1), " ");
% 
%     B7 = strcat(B7,t_bef, " ", b_bef(8), " ");
%     B6 = strcat(B6,t_bef, " ", b_bef(7), " ");
%     B5 = strcat(B5,t_bef, " ", b_bef(6), " ");
%     B4 = strcat(B4,t_bef, " ", b_bef(5), " ");
%     B3 = strcat(B3,t_bef, " ", b_bef(4), " ");
%     B2 = strcat(B2,t_bef, " ", b_bef(3), " ");
%     B1 = strcat(B1,t_bef, " ", b_bef(2), " ");
%     B0 = strcat(B0,t_bef, " ", b_bef(1), " ");
% 
%     Cin = strcat(Cin,t_bef, " ", c_bef(1), " ");
% 
% 
% 
%     A7 = strcat(A7,t, " ", a(8), " ");
%     A6 = strcat(A6,t, " ", a(7), " ");
%     A5 = strcat(A5,t, " ", a(6), " ");
%     A4 = strcat(A4,t, " ", a(5), " ");
%     A3 = strcat(A3,t, " ", a(4), " ");
%     A2 = strcat(A2,t, " ", a(3), " ");
%     A1 = strcat(A1,t, " ", a(2), " ");
%     A0 = strcat(A0,t, " ", a(1), " ");
% 
%     B7 = strcat(B7,t, " ", b(8), " ");
%     B6 = strcat(B6,t, " ", b(7), " ");
%     B5 = strcat(B5,t, " ", b(6), " ");
%     B4 = strcat(B4,t, " ", b(5), " ");
%     B3 = strcat(B3,t, " ", b(4), " ");
%     B2 = strcat(B2,t, " ", b(3), " ");
%     B1 = strcat(B1,t, " ", b(2), " ");
%     B0 = strcat(B0,t, " ", b(1), " ");
% 
%     Cin = strcat(Cin,t, " ", c(1), " ");
end

% A7 = strcat(A7,")");
% A6 = strcat(A6,")");
% A5 = strcat(A5,")");
% A4 = strcat(A4,")");
% A3 = strcat(A3,")");
% A2 = strcat(A2,")");
% A1 = strcat(A1,")");
% A0 = strcat(A0,")");
% 
% B7 = strcat(B7,")");
% B6 = strcat(B6,")");
% B5 = strcat(B5,")");
% B4 = strcat(B4,")");
% B3 = strcat(B3,")");
% B2 = strcat(B2,")");
% B1 = strcat(B1,")");
% B0 = strcat(B0,")");

% Cin = strcat(Cin,")");
fclose(Cin);
fclose(A0);
fclose(A1);
fclose(A2);
fclose(A3);
fclose(A4);
fclose(A5);
fclose(A6);
fclose(A7);
fclose(B0);
fclose(B1);
fclose(B2);
fclose(B3);
fclose(B4);
fclose(B5);
fclose(B6);
fclose(B7);





