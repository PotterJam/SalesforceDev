trigger QualityHandlerTrigger on Quality_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
