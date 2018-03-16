# ECS 160: HW 4
#### Team: Andrew Shephard, Nausheen Sujela


#### Fuzzing Homework Part 2.1 (Fuzzing given code)

Below are the details of all 10 crashes we discovered when fuzzing the instructor-provided code.

We ran the fuzzer overnight.

#### —- CRASH 1 —-  
    
Defect Line: No. 72  

Brief Description of Crash  
```
Starting program: /other-afl-examples/csv/csv-prem id:000000,sig:11,src:000000,op:flip1,pos:47

Input file: id:000000,sig:11,src:000000,op:flip1,pos:47

Program received signal SIGSEGV, Segmentation fault.
strlen () at ../sysdeps/x86_64/strlen.S:106
(gdb) bt
#0  strlen () at ../sysdeps/x86_64/strlen.S:106
#1  0x00007ffff7a9847e in __GI___strdup (s=0x0) at strdup.c:41
#2  0x00000000004013e5 in main (argc=<optimized out>, argv=<optimized out>) at test-hw2.c:72
```
#### —- CRASH 2 —-
Defect Line No. 72  
Brief Description of Crash  
```
Starting program: /other-afl-examples/csv/csv-prem id:000001,sig:11,src:000000,op:flip1,pos:80

Input file: id:000001,sig:11,src:000000,op:flip1,pos:80

Program received signal SIGSEGV, Segmentation fault.
strlen () at ../sysdeps/x86_64/strlen.S:106
(gdb) bt
#0  strlen () at ../sysdeps/x86_64/strlen.S:106
#1  0x00007ffff7a9847e in __GI___strdup (s=0x0) at strdup.c:41
#2  0x00000000004013e5 in main (argc=<optimized out>, argv=<optimized out>) at test-hw2.c:72
```
#### —- CRASH 3 —-
Defect Line No. 72  
Brief Description of Crash  
```
Starting program: /other-afl-examples/csv/csv-prem id:000002,sig:11,src:000000,op:flip32,pos:1
22
Input file: id:000002,sig:11,src:000000,op:flip32,pos:122

Program received signal SIGSEGV, Segmentation fault.
strlen () at ../sysdeps/x86_64/strlen.S:106
(gdb) bt
#0  strlen () at ../sysdeps/x86_64/strlen.S:106
#1  0x00007ffff7a9847e in __GI___strdup (s=0x0) at strdup.c:41
#2  0x00000000004013e5 in main (argc=<optimized out>, argv=<optimized out>) at test-hw2.c:72
```
#### —- CRASH 4 —-
Defect Line No. 72  
Brief Description of Crash  
```
Starting program: /other-afl-examples/csv/csv-prem id:000003,sig:11,src:000000,op:flip32,pos:1
69
Input file: id:000003,sig:11,src:000000,op:flip32,pos:169

Program received signal SIGSEGV, Segmentation fault.
strlen () at ../sysdeps/x86_64/strlen.S:106
(gdb) bt
#0  strlen () at ../sysdeps/x86_64/strlen.S:106
#1  0x00007ffff7a9847e in __GI___strdup (s=0x0) at strdup.c:41
#2  0x00000000004013e5 in main (argc=<optimized out>, argv=<optimized out>) at test-hw2.c:72
```
#### —- CRASH 5 —-
Defect Line No. 72  
Brief Description of Crash  
```
Starting program: /other-afl-examples/csv/csv-prem id:000004,sig:11,src:000000,op:arith8,pos:4
,val:-24
Input file: id:000004,sig:11,src:000000,op:arith8,pos:4,val:-24

Program received signal SIGSEGV, Segmentation fault.
strlen () at ../sysdeps/x86_64/strlen.S:106
(gdb) bt
#0  strlen () at ../sysdeps/x86_64/strlen.S:106
#1  0x00007ffff7a9847e in __GI___strdup (s=0x0) at strdup.c:41
#2  0x00000000004013e5 in main (argc=<optimized out>, argv=<optimized out>) at test-hw2.c:72
```

#### —- CRASH 6 —-
Defect Line No. 72  
Brief Description of Crash  
```
Starting program: /other-afl-examples/csv/test-hw2.x id:000005,sig:11,src:000000,op:arith8,pos:38,val:-24

Program received signal SIGSEGV, Segmentation fault.
strlen () at ../sysdeps/x86_64/strlen.S:106
(gdb) bt
#0  strlen () at ../sysdeps/x86_64/strlen.S:106
#1  0x00007ffff7a9847e in __GI___strdup (s=0x0) at strdup.c:41
#2  0x00000000004013e5 in main (argc=<optimized out>, argv=<optimized out>) at test-hw2.c:72
```
Input File Causing Crash: 
```
id:000005,sig:11,src:000000,op:arith8,pos:38,val:-24
```

#### —- CRASH 7 —-
Defect Line No. 72  
Brief Description of Crash  
```
Starting program: /other-afl-examples/csv/test-hw2.x id:000006,sig:11,src:000000,op:arith8,pos:44,val:-34
Input file: id:000006,sig:11,src:000000,op:arith8,pos:44,val:-34

Program received signal SIGSEGV, Segmentation fault.
strlen () at ../sysdeps/x86_64/strlen.S:106
(gdb) bt
#0  strlen () at ../sysdeps/x86_64/strlen.S:106
#1  0x00007ffff7a9847e in __GI___strdup (s=0x0) at strdup.c:41
#2  0x00000000004013e5 in main (argc=<optimized out>, argv=<optimized out>) at test-hw2.c:72
```
Input File Causing Crash: 
```
id:000006,sig:11,src:000000,op:arith8,pos:44,val:-34
```

#### —- CRASH 8 —-
Defect Line No. 72  
Brief Description of Crash  
```
Starting program: /other-afl-examples/csv/test-hw2.x id:000007,sig:11,src:000000,op:arith8,pos:110,val:-24

Program received signal SIGSEGV, Segmentation fault.
strlen () at ../sysdeps/x86_64/strlen.S:106
(gdb) bt
#0  strlen () at ../sysdeps/x86_64/strlen.S:106
#1  0x00007ffff7a9847e in __GI___strdup (s=0x0) at strdup.c:41
#2  0x00000000004013e5 in main (argc=<optimized out>, argv=<optimized out>) at test-hw2.c:72
```
Input File Causing Crash: 
```
id:000007,sig:11,src:000000,op:arith8,pos:110,val:-24
```

#### —- CRASH 9 —-
Defect Line No. 72  
Brief Description of Crash  
```
Starting program: /other-afl-examples/csv/test-hw2.x id:000008,sig:11,src:000000,op:havoc,rep:64

Program received signal SIGSEGV, Segmentation fault.
strlen () at ../sysdeps/x86_64/strlen.S:106
(gdb) bt
#0  strlen () at ../sysdeps/x86_64/strlen.S:106
#1  0x00007ffff7a9847e in __GI___strdup (s=0x0) at strdup.c:41
#2  0x00000000004013e5 in main (argc=<optimized out>, argv=<optimized out>) at test-hw2.c:72
```
Input File Causing Crash: 
```
id:000008,sig:11,src:000000,op:havoc,rep:64
```

#### —- CRASH 10 —-
Defect Line No. 72  
Brief Description of Crash  
```
Starting program: /other-afl-examples/csv/test-hw2.x id:000009,sig:11,src:000000,op:havoc,rep:128

Program received signal SIGSEGV, Segmentation fault.
strlen () at ../sysdeps/x86_64/strlen.S:106
(gdb) bt
#0  strlen () at ../sysdeps/x86_64/strlen.S:106
#1  0x00007ffff7a9847e in __GI___strdup (s=0x0) at strdup.c:41
#2  0x00000000004013e5 in main (argc=<optimized out>, argv=<optimized out>) at test-hw2.c:72
```
Input File Causing Crash: 
```
id:000009,sig:11,src:000000,op:havoc,rep:128
```

#### Fuzzing Homework Part 2.2 (Adversarial Portion)

Unfortunately, the pair that was assigned to be our adversaries provided code that was incompatible with the fuzzer due to a whole host of errors in their source code.

Below is a link to a screenshot of us running their code on the fuzzer: 

https://drive.google.com/open?id=1EDphPDbGkbHGnpEArYC7IoYvnI8MZby9

We discussed this issue with the TAs and tried looking in the adversaries' source code to see if there was something we could quickly fix. We concluded that the problem is too deep-seated for us to rectify in a reasonable amount of time.