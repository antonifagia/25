all:
	@gfortran 25.F90 -o 25
install:
	@gfortran 25.F90 -o /usr/local/bin/25
uninstall:
	@rm -f /usr/local/bin/25
