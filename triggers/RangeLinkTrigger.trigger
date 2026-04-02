trigger RangeLinkTrigger on Range_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeLinkHandler.handleAfterDelete(Trigger.old);
    }
}
