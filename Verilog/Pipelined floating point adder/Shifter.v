module mux_2x1(output y,input i0,input i1,input s);
    assign y = !s&i0 | s&i1;
endmodule


module thirtyTwoBitShifter( output[31:0] out,input [31:0]a,input [5:0]shift);



    //1st layer 
    wire y10,y11,y12,y13,y14,y15,y16,y17,y18,y19,y110,y111,y112,y113,y114,y115,y116,y117,y118,y119,y120,y121,y122,y123,y124,y125,y126,y127,y128,y129,y130,y131;
    mux_2x1 m10 (y10,a[0],a[1],shift[0]);
    mux_2x1 m11 (y11,a[1],a[2],shift[0]);
    mux_2x1 m12 (y12,a[2],a[3],shift[0]);
    mux_2x1 m13 (y13,a[3],a[4],shift[0]);
    mux_2x1 m14 (y14,a[4],a[5],shift[0]);
    mux_2x1 m15 (y15,a[5],a[6],shift[0]);
    mux_2x1 m16 (y16,a[6],a[7],shift[0]);
    mux_2x1 m17 (y17,a[7],a[8],shift[0]);
    mux_2x1 m18 (y18,a[8],a[9],shift[0]);
    mux_2x1 m19 (y19,a[9],a[10],shift[0]);
    mux_2x1 m110 (y110,a[10],a[11],shift[0]);
    mux_2x1 m111 (y111,a[11],a[12],shift[0]);
    mux_2x1 m112 (y112,a[12],a[13],shift[0]);
    mux_2x1 m113 (y113,a[13],a[14],shift[0]);
    mux_2x1 m114 (y114,a[14],a[15],shift[0]);
    mux_2x1 m115 (y115,a[15],a[16],shift[0]);
    mux_2x1 m116 (y116,a[16],a[17],shift[0]);
    mux_2x1 m117 (y117,a[17],a[18],shift[0]);
    mux_2x1 m118 (y118,a[18],a[19],shift[0]);
    mux_2x1 m119 (y119,a[19],a[20],shift[0]);
    mux_2x1 m120 (y120,a[20],a[21],shift[0]);
    mux_2x1 m121 (y121,a[21],a[22],shift[0]);
    mux_2x1 m122 (y122,a[22],a[23],shift[0]);
    mux_2x1 m123 (y123,a[23],a[24],shift[0]);
    mux_2x1 m124 (y124,a[24],a[25],shift[0]);
    mux_2x1 m125 (y125,a[25],a[26],shift[0]);
    mux_2x1 m126 (y126,a[26],a[27],shift[0]);
    mux_2x1 m127 (y127,a[27],a[28],shift[0]);
    mux_2x1 m128 (y128,a[28],a[29],shift[0]);
    mux_2x1 m129 (y129,a[29],a[30],shift[0]);
    mux_2x1 m130 (y130,a[30],a[31],shift[0]);
    mux_2x1 m131 (y131,a[31],1'b0,shift[0]);

    //2nd layer
   wire y20,y21,y22,y23,y24,y25,y26,y27,y28,y29,y210,y211,y212,y213,y214,y215,y216,y217,y218,y219,y220,y221,y222,y223,y224,y225,y226,y227,y228,y229,y230,y231;
    
    mux_2x1 m20 (y20,y10,y12,shift[1]);
    mux_2x1 m21 (y21,y11,y13,shift[1]);
    mux_2x1 m22 (y22,y12,y14,shift[1]);
    mux_2x1 m23 (y23,y13,y15,shift[1]);
    mux_2x1 m24 (y24,y14,y16,shift[1]);
    mux_2x1 m25 (y25,y15,y17,shift[1]);
    mux_2x1 m26 (y26,y16,y18,shift[1]);
    mux_2x1 m27 (y27,y17,y19,shift[1]);
    mux_2x1 m28 (y28,y18,y110,shift[1]);
    mux_2x1 m29 (y29,y19,y111,shift[1]);
    mux_2x1 m210 (y210,y110,y112,shift[1]);
    mux_2x1 m211 (y211,y111,y113,shift[1]);
    mux_2x1 m212 (y212,y112,y114,shift[1]);
    mux_2x1 m213 (y213,y113,y115,shift[1]);
    mux_2x1 m214 (y214,y114,y116,shift[1]);
    mux_2x1 m215 (y215,y115,y117,shift[1]);
    mux_2x1 m216 (y216,y116,y118,shift[1]);
    mux_2x1 m217 (y217,y117,y119,shift[1]);
    mux_2x1 m218 (y218,y118,y120,shift[1]);
    mux_2x1 m219 (y219,y119,y121,shift[1]);
    mux_2x1 m220 (y220,y120,y122,shift[1]);
    mux_2x1 m221 (y221,y121,y123,shift[1]);
    mux_2x1 m222 (y222,y122,y124,shift[1]);
    mux_2x1 m223 (y223,y123,y125,shift[1]);
    mux_2x1 m224 (y224,y124,y126,shift[1]);
    mux_2x1 m225 (y225,y125,y127,shift[1]);
    mux_2x1 m226 (y226,y126,y128,shift[1]);
    mux_2x1 m227 (y227,y127,y129,shift[1]);
    mux_2x1 m228 (y228,y128,y130,shift[1]);
    mux_2x1 m229 (y229,y129,y131,shift[1]);
    mux_2x1 m230 (y230,y130,1'b0,shift[1]);
    mux_2x1 m231 (y231,y131,1'b0,shift[1]);



    //3rd layer
  wire y30,y31,y32,y33,y34,y35,y36,y37,y38,y39,y310,y311,y312,y313,y314,y315,y316,y317,y318,y319,y320,y321,y322,y323,y324,y325,y326,y327,y328,y329,y330,y331;
    
    mux_2x1 m30 (y30,y20,y24,shift[2]);
    mux_2x1 m31 (y31,y21,y25,shift[2]);
    mux_2x1 m32 (y32,y22,y26,shift[2]);
    mux_2x1 m33 (y33,y23,y27,shift[2]);
    mux_2x1 m34 (y34,y24,y28,shift[2]);
    mux_2x1 m35 (y35,y25,y29,shift[2]);
    mux_2x1 m36 (y36,y26,y210,shift[2]);
    mux_2x1 m37 (y37,y27,y211,shift[2]);
    mux_2x1 m38 (y38,y28,y212,shift[2]);
    mux_2x1 m39 (y39,y29,y213,shift[2]);
    mux_2x1 m310 (y310,y210,y214,shift[2]);
    mux_2x1 m311 (y311,y211,y215,shift[2]);
    mux_2x1 m312 (y312,y212,y216,shift[2]);
    mux_2x1 m313 (y313,y213,y217,shift[2]);
    mux_2x1 m314 (y314,y214,y218,shift[2]);
    mux_2x1 m315 (y315,y215,y219,shift[2]);
    mux_2x1 m316 (y316,y216,y220,shift[2]);
    mux_2x1 m317 (y317,y217,y221,shift[2]); 
    mux_2x1 m318 (y318,y218,y222,shift[2]);
    mux_2x1 m319 (y319,y219,y223,shift[2]);
    mux_2x1 m320 (y320,y220,y224,shift[2]);
    mux_2x1 m321 (y321,y221,y225,shift[2]);
    mux_2x1 m322 (y322,y222,y226,shift[2]);
    mux_2x1 m323 (y323,y223,y227,shift[2]);
    mux_2x1 m324 (y324,y224,y228,shift[2]);
    mux_2x1 m325 (y325,y225,y229,shift[2]);
    mux_2x1 m326 (y326,y226,y230,shift[2]);
    mux_2x1 m327 (y327,y227,y231,shift[2]);
    mux_2x1 m328 (y328,y228,1'b0,shift[2]);
    mux_2x1 m329 (y329,y229,1'b0,shift[2]);
    mux_2x1 m330 (y330,y230,1'b0,shift[2]);
    mux_2x1 m331 (y331,y231,1'b0,shift[2]);



   //4th layer


   wire y40,y41,y42,y43,y44,y45,y46,y47,y48,y49,y410,y411,y412,y413,y414,y415,y416,y417,y418,y419,y420,y421,y422,y423,y424,y425,y426,y427,y428,y429,y430,y431;
    
    mux_2x1 m40 (y40,y30,y38,shift[3]);
    mux_2x1 m41 (y41,y31,y39,shift[3]);
    mux_2x1 m42 (y42,y32,y310,shift[3]);
    mux_2x1 m43 (y43,y33,y311,shift[3]);
    mux_2x1 m44 (y44,y34,y312,shift[3]);
    mux_2x1 m45 (y45,y35,y313,shift[3]);
    mux_2x1 m46 (y46,y36,y314,shift[3]);
    mux_2x1 m47 (y47,y37,y315,shift[3]);
    mux_2x1 m48 (y48,y38,y316,shift[3]);
    mux_2x1 m49 (y49,y39,y317,shift[3]);
    mux_2x1 m410 (y410,y310,y318,shift[3]);
    mux_2x1 m411 (y411,y311,y319,shift[3]);
    mux_2x1 m412 (y412,y312,y320,shift[3]);
    mux_2x1 m413 (y413,y313,y321,shift[3]);
    mux_2x1 m414 (y414,y314,y322,shift[3]);
    mux_2x1 m415 (y415,y315,y323,shift[3]);
    mux_2x1 m416 (y416,y316,y324,shift[3]);
    mux_2x1 m417 (y417,y317,y325,shift[3]);
    mux_2x1 m418 (y418,y318,y326,shift[3]);
    mux_2x1 m419 (y419,y319,y327,shift[3]);
    mux_2x1 m420 (y420,y320,y328,shift[3]);
    mux_2x1 m421 (y421,y321,y329,shift[3]);
    mux_2x1 m422 (y422,y322,y330,shift[3]);
    mux_2x1 m423 (y423,y323,y331,shift[3]);
    mux_2x1 m424 (y424,y324,1'b0,shift[3]);
    mux_2x1 m425 (y425,y325,1'b0,shift[3]);
    mux_2x1 m426 (y426,y326,1'b0,shift[3]);
    mux_2x1 m427 (y427,y327,1'b0,shift[3]);
    mux_2x1 m428 (y428,y328,1'b0,shift[3]);
    mux_2x1 m429 (y429,y329,1'b0,shift[3]);
    mux_2x1 m430 (y430,y330,1'b0,shift[3]);
    mux_2x1 m431 (y431,y331,1'b0,shift[3]);

    //5th layer


   wire y50,y51,y52,y53,y54,y55,y56,y57,y58,y59,y510,y511,y512,y513,y514,y515,y516,y517,y518,y519,y520,y521,y522,y523,y524,y525,y526,y527,y528,y529,y530,y531;
    
    mux_2x1 m50 (y50,y40,y416,shift[4]);
    mux_2x1 m51 (y51,y41,y417,shift[4]);
    mux_2x1 m52 (y52,y42,y418,shift[4]);
    mux_2x1 m53 (y53,y43,y419,shift[4]);
    mux_2x1 m54 (y54,y44,y420,shift[4]);
    mux_2x1 m55 (y55,y45,y421,shift[4]);
    mux_2x1 m56 (y56,y46,y422,shift[4]);
    mux_2x1 m57 (y57,y47,y423,shift[4]);
    mux_2x1 m58 (y58,y48,y424,shift[4]);
    mux_2x1 m59 (y59,y49,y425,shift[4]);
    mux_2x1 m510 (y510,y410,y426,shift[4]);
    mux_2x1 m511 (y511,y411,y427,shift[4]);
    mux_2x1 m512 (y512,y412,y428,shift[4]);
    mux_2x1 m513 (y513,y413,y429,shift[4]);
    mux_2x1 m514 (y514,y414,y430,shift[4]);
    mux_2x1 m515 (y515,y415,y431,shift[4]);
    mux_2x1 m516 (y516,y416,1'b0,shift[4]);
    mux_2x1 m517 (y517,y417,1'b0,shift[4]);
    mux_2x1 m518 (y518,y418,1'b0,shift[4]);
    mux_2x1 m519 (y519,y419,1'b0,shift[4]);
    mux_2x1 m520 (y520,y420,1'b0,shift[4]);
    mux_2x1 m521 (y521,y421,1'b0,shift[4]);
    mux_2x1 m522 (y522,y422,1'b0,shift[4]);
    mux_2x1 m523 (y523,y423,1'b0,shift[4]);
    mux_2x1 m524 (y524,y424,1'b0,shift[4]);
    mux_2x1 m525 (y525,y425,1'b0,shift[4]);
    mux_2x1 m526 (y526,y426,1'b0,shift[4]);
    mux_2x1 m527 (y527,y427,1'b0,shift[4]);
    mux_2x1 m528 (y528,y428,1'b0,shift[4]);
    mux_2x1 m529 (y529,y429,1'b0,shift[4]);
    mux_2x1 m530 (y530,y430,1'b0,shift[4]);
    mux_2x1 m531 (y531,y431,1'b0,shift[4]);

    //6th layer

   wire y60,y61,y62,y63,y64,y65,y66,y67,y68,y69,y610,y611,y612,y613,y614,y615,y616,y617,y618,y619,y620,y621,y622,y623,y624,y625,y626,y627,y628,y629,y630,y631;
    
    mux_2x1 m60 (y60,y50,1'b0,shift[5]);
    mux_2x1 m61 (y61,y51,1'b0,shift[5]);
    mux_2x1 m62 (y62,y52,1'b0,shift[5]);
    mux_2x1 m63 (y63,y53,1'b0,shift[5]);
    mux_2x1 m64 (y64,y54,1'b0,shift[5]);
    mux_2x1 m65 (y65,y55,1'b0,shift[5]);
    mux_2x1 m66 (y66,y56,1'b0,shift[5]);
    mux_2x1 m67 (y67,y57,1'b0,shift[5]);
    mux_2x1 m68 (y68,y58,1'b0,shift[5]);
    mux_2x1 m69 (y69,y59,1'b0,shift[5]);
    mux_2x1 m610 (y610,y510,1'b0,shift[5]);
    mux_2x1 m611 (y611,y511,1'b0,shift[5]);
    mux_2x1 m612 (y612,y512,1'b0,shift[5]);
    mux_2x1 m613 (y613,y513,1'b0,shift[5]);
    mux_2x1 m614 (y614,y514,1'b0,shift[5]);
    mux_2x1 m615 (y615,y515,1'b0,shift[5]);
    mux_2x1 m616 (y616,y516,1'b0,shift[5]);
    mux_2x1 m617 (y617,y517,1'b0,shift[5]);
    mux_2x1 m618 (y618,y518,1'b0,shift[5]);
    mux_2x1 m619 (y619,y519,1'b0,shift[5]);
    mux_2x1 m620 (y620,y520,1'b0,shift[5]);
    mux_2x1 m621 (y621,y521,1'b0,shift[5]);
    mux_2x1 m622 (y622,y522,1'b0,shift[5]);
    mux_2x1 m623 (y623,y523,1'b0,shift[5]);
    mux_2x1 m624 (y624,y524,1'b0,shift[5]);
    mux_2x1 m625 (y625,y525,1'b0,shift[5]);
    mux_2x1 m626 (y626,y526,1'b0,shift[5]);
    mux_2x1 m627 (y627,y527,1'b0,shift[5]);
    mux_2x1 m628 (y628,y528,1'b0,shift[5]);
    mux_2x1 m629 (y629,y529,1'b0,shift[5]);
    mux_2x1 m630 (y630,y530,1'b0,shift[5]);
    mux_2x1 m631 (y631,y531,1'b0,shift[5]);


   // assign out = {y231,y230,y229,y228,y227,y226,y225,y224,y223,y222,y221,y220,y219,y218,y217,y216,y215,y214,y213,y212,y211,y210,y29,y28,y27,y26,y25,y24,y23,y22,y21,y20};
  assign out = {y631,y630,y629,y628,y627,y626,y625,y624,y623,y622,y621,y620,y619,y618,y617,y616,y615,y614,y613,y612,y611,y610,y69,y68,y67,y66,y65,y64,y63,y62,y61,y60};
 

    //assign out = {y431,y430,y429,y428,y427,y426,y425,y424,y423,y422,y421,y420,y419,y418,y417,y416,y415,y414,y413,y412,y411,y410,y49,y48,y47,y46,y45,y44,y43,y42,y41,y40};
    //assign out = {i3,i2,i1,i0};
endmodule

/*
module test;
    reg [31:0] a,b;
    reg [5:0] shift;
    wire [31:0] out;
    
    thirtyTwoBitShifter bs1(out,a,shift);

    initial
    begin
        a = 32'b11111111111111111111111111111111;
        shift = 6'b100000;
        #10 shift = 6'b011111;
        #10 shift = 6'b000010;
    end
    
    initial
        $monitor($time," a = %b;shift = %b; out = %b;",a,shift,out); // mux checker
endmodule*/
