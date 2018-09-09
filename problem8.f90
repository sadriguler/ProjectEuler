PROGRAM MAIN
	IMPLICIT NONE
	INTEGER*8 :: ind1, ind2, ind3, dummynumber
	CHARACTER(100) :: readstring	
	INTEGER*8 :: numberofdigits = 13
	INTEGER*8 :: biggernumbers(1:13)
	INTEGER*8 :: multiplication, maxmultiplication

	maxmultiplication = 0
	DO ind1 = 1,numberofdigits
		biggernumbers(ind1) = 0
	END DO

	OPEN(unit = 2001, file = 'problem8.txt')
	DO ind1 = 1,20
		READ(unit = 2001,FMT=*)readstring
		DO ind2 = 1,50
			dummynumber = ICHAR(readstring(ind2:ind2))-48
			multiplication = 1
			DO ind3 = 1,numberofdigits-1
				biggernumbers(ind3) = biggernumbers(ind3+1)
				multiplication = multiplication * biggernumbers(ind3)
			END DO
			biggernumbers(numberofdigits) = dummynumber
			multiplication = multiplication * biggernumbers(numberofdigits)
			IF (multiplication > maxmultiplication) THEN
				maxmultiplication = multiplication
			END IF
		END DO
	END DO
	CLOSE(2001)

	PRINT*, maxmultiplication
END PROGRAM
