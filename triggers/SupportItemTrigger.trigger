trigger SupportItemTrigger on Support_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportItemHandler.handleAfterDelete(Trigger.old);
    }
}
