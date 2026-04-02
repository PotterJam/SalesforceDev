trigger StatusNodeTrigger on Status_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusNodeHandler.handleAfterDelete(Trigger.old);
    }
}
