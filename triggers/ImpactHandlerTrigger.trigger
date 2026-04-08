trigger ImpactHandlerTrigger on Impact_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
