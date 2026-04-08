trigger LabelProcessorTrigger on Label_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
