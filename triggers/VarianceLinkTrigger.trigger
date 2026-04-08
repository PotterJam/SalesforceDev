trigger VarianceLinkTrigger on Variance_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceLinkHandler.handleAfterDelete(Trigger.old);
    }
}
