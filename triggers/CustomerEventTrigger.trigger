trigger CustomerEventTrigger on Customer_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerEventHandler.handleAfterDelete(Trigger.old);
    }
}
