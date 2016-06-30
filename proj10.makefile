proj10: proj10.driver.o proj10.support.o
    gcc -o proj10 proj10.support.o proj10.driver.o
proj10.support.o: proj10.support.s
    gcc -Wall -c proj10.support.s
proj10.driver.o: proj10.driver.c
    gcc -Wall -c proj10.driver.c
