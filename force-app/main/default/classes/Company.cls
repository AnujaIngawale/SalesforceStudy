public class Company{
    public String companyName ;
    public String ceo;
    public Integer employeeCount;
    public Long revenue;
    
    //List of Customers
    
    List <Client> customers = new List <Client>();
    
    //Add new customer
    public void addNewCustomers(String clientName, String website, String email, Long phone){
        Client customer = new Client(clientName, website, email, phone);
        customers.add(customer);
    }
    
    //Print the list of all the customers
    public void getAllCustomers(){
        for(Client customer : customers){
            System.debug('Client name : '+customer.clientName +', Website : '+customer.website+', Phone : '+customer.phone+', Email : '+customer.email);
        }
    }
    
    // Private inner class to store the customer information
    
    private class Client {
    
        public String clientName;
        public String website;
        public String email;
        public Long phone;
        
        Client(String clientName, String website, String email, Long phone){
            this.clientName = clientName;
            this.website = website;
            this.email = email;
            this.phone = phone;
        
        
        }
    
    }
}