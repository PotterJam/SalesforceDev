trigger DeliverableAuditTrigger on Deliverable_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableAuditHandler.handleAfterDelete(Trigger.old);
    }
}
