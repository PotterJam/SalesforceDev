trigger CustomerProcessorTrigger on Customer_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
