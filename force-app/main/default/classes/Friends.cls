public class Friends {
final Integer ONLY_ONE_SLICE = 8;
final Integer UPTO_THREE_SLICES = 7;
final Integer MORE_THAN_THREE_SLICES = 6;
/*
Integer numberOfSlices = 0;

// Calculate Ross's amount
numberOfSlices = 3;
Integer rossHasToPay = numberOfSlices == 1 ? ONLY_ONE_SLICE*numberOfSlices :
	(numberOfSlices <= 3 ? UPTO_THREE_SLICES*numberOfSlices :
		MORE_THAN_THREE_SLICES*numberOfSlices);

System.debug('Ross has to pay - '+rossHasToPay);

// Calculate Chandler's amount
numberOfSlices = 1;
Integer chandlerHasToPay = numberOfSlices == 1 ? ONLY_ONE_SLICE*numberOfSlices :
	(numberOfSlices <= 3 ? UPTO_THREE_SLICES*numberOfSlices :
		MORE_THAN_THREE_SLICES*numberOfSlices);

System.debug('Chandler has to pay - '+chandlerHasToPay);

// Calculate Joey's amount
numberOfSlices = 4;
Integer joeyHasToPay = numberOfSlices == 1 ? ONLY_ONE_SLICE*numberOfSlices :
	(numberOfSlices <= 3 ? UPTO_THREE_SLICES*numberOfSlices :
		MORE_THAN_THREE_SLICES*numberOfSlices);

System.debug('Joey has to pay - '+joeyHasToPay);

*/
    
    public Integer getBill(Integer numberOfSlices){
        
        Integer billAmount = numberOfSlices == 1 ? ONLY_ONE_SLICE*numberOfSlices :
							 (numberOfSlices <= 3 ? UPTO_THREE_SLICES*numberOfSlices :
							 MORE_THAN_THREE_SLICES*numberOfSlices);
        return billAmount;
        
    }
}