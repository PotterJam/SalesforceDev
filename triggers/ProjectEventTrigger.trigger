trigger ProjectEventTrigger on Project_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectEventHandler.handleAfterDelete(Trigger.old);
    }
}
