PROGRAM MAIN
	IMPLICIT NONE
	REAL :: a,b,c
	INTEGER :: ind1, ind2
	DO ind1 = 1,1000
		a = ind1
		DO ind2 = ind1+1,1000
			b = ind2
			IF (a+b<1000) THEN 
				c = SQRT(a*a+b*b)
				IF (a+b+c==1000) THEN
					PRINT*, a,b,c
					PRINT*, a*b*c
					STOP
				END IF
			END IF
		END DO
	END DO

END PROGRAM
