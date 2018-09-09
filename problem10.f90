

PROGRAM MAIN
	IMPLICIT NONE
	INTEGER :: checkval = 0
	INTEGER :: primenumbers(1:1000000)
	INTEGER :: ind1, ind2
	INTEGER :: primenumber
	INTEGER :: counter
	INTEGER*16 :: sumval
	primenumbers(1:6) = (/2,3,5,7,11,13/)
	
	counter = 6
	
	
	DO ind1 = 15,2000000
		checkval = 0
		DO ind2 = 1,counter
			primenumber = primenumbers(ind2)
			IF (primenumber*primenumber<=ind1) THEN
				IF ( MOD(ind1,primenumber)  == 0 )THEN
					checkval = 1
					EXIT
				END IF
			END IF
		END DO
		IF (checkval == 0) THEN
			counter = counter + 1
			primenumbers(counter) = ind1
			!PRINT*, 'New prime number is found:',counter, ind1
			!IF (counter==20) THEN
			!	EXIT
			!END IF
		END IF
	END DO 
	
	sumval = 0
	DO ind1 = 1,counter
		sumval = sumval + primenumbers(ind1)
	END DO
	PRINT*, sumval
END PROGRAM
