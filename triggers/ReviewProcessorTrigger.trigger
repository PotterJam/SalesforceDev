trigger ReviewProcessorTrigger on Review_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
