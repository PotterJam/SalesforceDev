trigger ApprovalMappingTrigger on Approval_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalMappingHandler.handleAfterDelete(Trigger.old);
    }
}
