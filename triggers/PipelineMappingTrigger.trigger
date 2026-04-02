trigger PipelineMappingTrigger on Pipeline_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineMappingHandler.handleAfterDelete(Trigger.old);
    }
}
