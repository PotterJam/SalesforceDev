trigger ResourceItemTrigger on Resource_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceItemHandler.handleAfterDelete(Trigger.old);
    }
}
