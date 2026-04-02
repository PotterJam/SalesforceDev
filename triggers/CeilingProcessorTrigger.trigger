trigger CeilingProcessorTrigger on Ceiling_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
