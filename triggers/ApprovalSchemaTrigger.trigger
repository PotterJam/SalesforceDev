trigger ApprovalSchemaTrigger on Approval_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
