trigger AlertProcessorTrigger on Alert_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
