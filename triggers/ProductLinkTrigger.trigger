trigger ProductLinkTrigger on Product_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductLinkHandler.handleAfterDelete(Trigger.old);
    }
}
