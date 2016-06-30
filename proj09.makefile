proj09: proj09.support.o /user/cse320/Projects/project09.driver.o
    gcc -o proj09 proj09.support.o /user/cse320/Projects/project09.driver.o

proj09.support.o: proj09.support.s
    gcc -Wall -c proj09.support.s  
