trigger ApprovalModuleTrigger on Approval_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalModuleHandler.handleAfterDelete(Trigger.old);
    }
}
