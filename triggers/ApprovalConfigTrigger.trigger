trigger ApprovalConfigTrigger on Approval_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalConfigHandler.handleAfterDelete(Trigger.old);
    }
}
