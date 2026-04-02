trigger ApprovalCatalogTrigger on Approval_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
