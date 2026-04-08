trigger WorkflowCatalogTrigger on Workflow_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
