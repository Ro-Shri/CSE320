proj07: proj07.student.o
    gcc -o proj07 proj07.student.o
proj07.student.o: proj07.student.s
    gcc -Wall -c proj07.student.s
