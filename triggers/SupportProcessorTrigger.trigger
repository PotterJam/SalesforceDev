trigger SupportProcessorTrigger on Support_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
