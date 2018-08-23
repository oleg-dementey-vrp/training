public class Example5 {

    public static void func() {
        deleteContactsAndLeads('Contact');
        deleteContactsAndLeads('Lead');
    }

    public static void deleteContactsAndLeads(String sObjectApiName) {
        List<SObject> sObjects = Database.query('SELECT Name FROM ' + sObjectApiName + ' LIMIT 5000');
        List<SObject> duplicateSobjects = new List<SObject>();
        Set<String> uniqueSobjects = new Set<String>();
        for (SObject item: sObjects) {
            if (uniqueSobjects.contains((String)item.get('Name'))) {
                duplicateSobjects.add(item);
            } else {
                uniqueSobjects.add((String)item.get('Name'));
            }
        }
        delete duplicateSobjects;
    }
}