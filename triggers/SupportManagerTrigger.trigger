trigger SupportManagerTrigger on Support_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportManagerHandler.handleAfterDelete(Trigger.old);
    }
}
