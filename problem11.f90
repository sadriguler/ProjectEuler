PROGRAM MAIN
	IMPLICIT NONE
	INTEGER*16 :: ind1, ind2, ind3
	INTEGER*16 :: multiplication, maxmultiplication
	INTEGER*16 :: gridarray(1:20,1:20)
	INTEGER*16 :: smallarray(1:4,1:4)

	maxmultiplication = 0
	OPEN(unit = 2001, file = 'problem11.txt')
	DO ind1 = 1,20
		READ(unit = 2001,FMT=*)gridarray(ind1,:)
	END DO
	CLOSE(2001)

	DO ind1 = 1,17
		DO ind2 = 1,17
			smallarray = gridarray(ind1:ind1+3,ind2:ind2+3)
			! diagonal line: 1
			multiplication = (smallarray(1,1))*(smallarray(2,2))*(smallarray(3,3))*(smallarray(4,4))
			IF (multiplication > maxmultiplication) THEN
				maxmultiplication = multiplication
			END IF

			! diagonal line: 2
			multiplication = (smallarray(1,4))*(smallarray(2,3))*(smallarray(3,2))*(smallarray(4,1))
			IF (multiplication > maxmultiplication) THEN
				maxmultiplication = multiplication
			END IF

			!column
			DO ind3 = 1,4
				multiplication = smallarray(1,ind3)*smallarray(2,ind3)*smallarray(3,ind3)*smallarray(4,ind3)
				IF (multiplication > maxmultiplication) THEN
					maxmultiplication = multiplication
				END IF
			END DO

			!row 
			DO ind3 = 1,4
				multiplication = smallarray(ind3,1)*smallarray(ind3,2)*smallarray(ind3,3)*smallarray(ind3,4)
				IF (multiplication > maxmultiplication) THEN
					maxmultiplication = multiplication
				END IF
			END DO
		END DO
	END DO

	PRINT*, maxmultiplication
END PROGRAM
