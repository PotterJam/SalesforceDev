trigger PipelineBindingTrigger on Pipeline_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineBindingHandler.handleAfterDelete(Trigger.old);
    }
}
