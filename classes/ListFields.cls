public class ListFields {
    // throws an exception with a list possible profile permissions
    public static void printFields() {
        Map<String, Schema.SObjectField> fields = Schema.getGlobalDescribe().get('Profile').getDescribe().fields.getMap();
        
        List<String>ret = new List<String>();
        Integer permissionLength = 'Permission'.length();
        for (String field : fields.keySet()) {
            if (field.startsWith('permission')) {
                String permissionName = fields.get(field).getDescribe().getName();
                ret.add(permissionName.substring(permissionLength + 1));
            }
        }
        
        throw new StringException(String.join(ret, ','));
    }
}