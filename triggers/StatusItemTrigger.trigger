trigger StatusItemTrigger on Status_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusItemHandler.handleAfterDelete(Trigger.old);
    }
}
