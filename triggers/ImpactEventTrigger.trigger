trigger ImpactEventTrigger on Impact_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactEventHandler.handleAfterDelete(Trigger.old);
    }
}
