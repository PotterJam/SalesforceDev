trigger CategoryProcessorTrigger on Category_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
