trigger OrderLinkTrigger on Order_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderLinkHandler.handleAfterDelete(Trigger.old);
    }
}
