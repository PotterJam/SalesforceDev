trigger PipelineLinkTrigger on Pipeline_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineLinkHandler.handleAfterDelete(Trigger.old);
    }
}
