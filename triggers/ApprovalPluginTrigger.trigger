trigger ApprovalPluginTrigger on Approval_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalPluginHandler.handleAfterDelete(Trigger.old);
    }
}
