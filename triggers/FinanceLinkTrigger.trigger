trigger FinanceLinkTrigger on Finance_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceLinkHandler.handleAfterDelete(Trigger.old);
    }
}
