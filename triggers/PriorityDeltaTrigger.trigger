trigger PriorityDeltaTrigger on Priority_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
