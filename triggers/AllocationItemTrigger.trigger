trigger AllocationItemTrigger on Allocation_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationItemHandler.handleAfterDelete(Trigger.old);
    }
}
