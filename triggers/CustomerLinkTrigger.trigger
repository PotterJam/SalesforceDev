trigger CustomerLinkTrigger on Customer_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerLinkHandler.handleAfterDelete(Trigger.old);
    }
}
