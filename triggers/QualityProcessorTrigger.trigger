trigger QualityProcessorTrigger on Quality_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
