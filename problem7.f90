

PROGRAM MAIN
	IMPLICIT NONE
	INTEGER :: primenumbers(1:10001)
	INTEGER :: ind1, ind2
	INTEGER :: dummyval
	INTEGER :: counter
	primenumbers(1:6) = (/2,3,5,7,11,13/)
	
	counter = 15
	
	ind1 = 6
	DO WHILE (ind1/=10001)
		counter = counter + 1
		ind2 = 1
		DO WHILE(ind2<=ind1)
			dummyval = primenumbers(ind2)
			IF ( MOD(counter,dummyval)  == 0 )THEN
				EXIT
			END IF
			ind2 = ind2 + 1
		END DO
		IF (ind2-1 == ind1) THEN
			ind1 = ind1 + 1
			primenumbers(ind1) = counter
			PRINT*, ind1, counter
		END IF
	END DO 
END PROGRAM
