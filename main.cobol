IDENTIFICATION DIVISION.
PROGRAM-ID. COBOL_TEST.

DATA DIVISION.
WORKING-STORAGE SECTION.
       01 WS-NAME PIC A(30).
       01 WS-AGE PIC 9(2) VALUE 16.
       01 WS-AGE_GROUP PIC A(5).
       01 WS-COUNTER PIC 9(2) VALUE 1.
       01 WS-NEWLINE PIC A(1) VALUE " ".
       
       01 WS-FIBONACCI_NR PIC 9(4) VALUE 0.
       01 WS-FIBONACCI_LAST PIC 9(4) VALUE 1.
       01 WS-FIBONACCI_TEMP PIC 9(4) VALUE 0.
       
       01 WS-A PIC 9(3).
       01 WS-A_SKIP PIC 9(3).
       
       01 INP-DATA.
           10 INP-VAL-1 PIC 9(2).
           10 INP-VAL-2 PIC 9(2).
       01 WS-RES PIC 9(3) VALUE ZEROS.

       PROCEDURE DIVISION.
           A-PARA.
    
           *> Name and age
           MOVE 'x444556' TO WS-NAME.
           DISPLAY "My name is : "WS-NAME.
           IF WS-AGE IS GREATER THAN OR EQUAL 18
                   MOVE "ADULT" TO WS-AGE_GROUP
           ELSE IF WS-AGE IS GREATER THAN OR EQUAL 13
                   MOVE "TEEN " TO WS-AGE_GROUP
           ELSE
                   MOVE "CHILD" TO WS-AGE_GROUP
           END-IF.
           DISPLAY "My age is "WS-AGE" and I am a(n) "WS-AGE_GROUP.
           DISPLAY WS-NEWLINE.
    
           *> Countdown
           MOVE 3 TO WS-COUNTER.
           PERFORM A-COUNTDOWN WITH TEST AFTER UNTIL WS-COUNTER IS EQUAL 0
           
           DISPLAY WS-NEWLINE.
           
           *> Fibonacci sequence
           MOVE 5 TO WS-A_SKIP.
           PERFORM VARYING WS-A FROM 1 BY 1 UNTIL WS-A IS GREATER 10
                   MOVE WS-FIBONACCI_NR TO WS-FIBONACCI_TEMP
                   ADD WS-FIBONACCI_LAST TO WS-FIBONACCI_NR
                   MOVE WS-FIBONACCI_TEMP TO WS-FIBONACCI_LAST
                   if WS-A IS GREATER WS-A_SKIP
                             DISPLAY "FIBONACCI "WS-A" : "WS-FIBONACCI_NR
                   END-IF
           END-PERFORM.
           
           *> add two numbers from input
           DISPLAY WS-NEWLINE.
           DISPLAY "INPUT Nr.1! Max is 99: ".
           ACCEPT INP-VAL-1.
           DISPLAY "INPUT Nr.2! Max is 99: ".
           ACCEPT INP-VAL-2.
           ADD INP-VAL-1 INP-VAL-2 GIVING WS-RES.
           DISPLAY "RESULT: "INP-VAL-1" + "INP-VAL-2" = "WS-RES.
           
           *> call a C funktion with arguments
           CALL 'ctest' using 1337.
           
           STOP RUN.
    
           *> code for countdown
           A-COUNTDOWN.
           DISPLAY "Counting down ... "WS-COUNTER.
           SUBTRACT 1 FROM WS-COUNTER.
