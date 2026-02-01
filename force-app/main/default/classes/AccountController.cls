public class AccountController {
    public static List<Account> insertAccounts(List<Account> accountToInsert){
        insert accountToInsert;
        return accountToInsert;  
    }
    
    public static Account insertAccount(Account accountToInsert){
        insert accountToInsert;
        return accountToInsert;  
    }
    
    
    public static List<Account> getAllAccounts(){
        //retrieve all accounts and assign to a list collection
        List<Account> accounts = [SELECT Name, Phone FROM Account];
        return accounts;
    }
    
    public static void printAllAccounts(){
        //retrieve all accounts and assign to a list collection
        List<Account> accounts = getAllAccounts();
        //iterate over all accounts and print account information
        for(Account account : accounts){
            System.debug('Account Name : '+account.Name+' Account Phone : '+account.Phone);
        }
    }
}