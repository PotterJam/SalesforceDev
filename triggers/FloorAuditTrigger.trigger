trigger FloorAuditTrigger on Floor_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorAuditHandler.handleAfterDelete(Trigger.old);
    }
}
