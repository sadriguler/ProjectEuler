PROGRAM MAIN
	IMPLICIT NONE
	INTEGER :: dummyval
	INTEGER :: finalval
	INTEGER :: ind1, ind2
	INTEGER :: numberofdividers
	INTEGER :: multiplicator1, multiplicator2
	INTEGER :: dividers(1:1000,1:3)
	
	INTEGER :: checkval = 0
	INTEGER :: primenumbers(1:10000)
	INTEGER :: primenumber
	INTEGER :: counter
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	! find prime numbers
	primenumbers(1:6) = (/2,3,5,7,11,13/)
	counter = 6
	DO ind1 = 15,20000000
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
		END IF
		IF (counter == 10000) THEN
			EXIT
		END IF
	END DO 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
DO ind2 = 1,3
	DO ind1 = 1,1000
		dividers(ind1,ind2) = 0
	END DO
END DO
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	DO ind1 = 2,100000
		IF (MOD(ind1,2)==0) THEN
			multiplicator1 = ind1/2
			multiplicator2 = ind1 + 1
		ELSE 
			multiplicator1 = ind1
			multiplicator2 = (ind1 + 1)/2
		END IF

		dividers(:,1) = dividers(:,2)
		
		DO ind2 = 1,1000
			dividers(ind2,2)=0
		END DO
	
		counter = 1
		finalval = multiplicator2
		dummyval = 0
		DO WHILE (finalval /= 1)
			primenumber = primenumbers(counter)
			IF (MOD(finalval,primenumber)==0) 	THEN 
				finalval = finalval/primenumber
				dummyval = dummyval + 1
			ELSE
				counter = counter + 1
				dummyval = 0
			END IF
			dividers(counter,2) = dummyval
		END DO
		numberofdividers = 1
		DO ind2 = 1,1000
			numberofdividers = numberofdividers * (dividers(ind2,2) + dividers(ind2,1) + 1)
		END DO
!		PRINT*, multiplicator1,':',dividers(1:8,1)
!		PRINT*, multiplicator2,':',dividers(1:8,2)
!		PRINT*, multiplicator1*multiplicator2,numberofdividers
!		PRINT*, ''
		IF (numberofdividers > 500) THEN
			PRINT*, multiplicator1*multiplicator2,numberofdividers
			EXIT
		END IF
	END DO
END PROGRAM
