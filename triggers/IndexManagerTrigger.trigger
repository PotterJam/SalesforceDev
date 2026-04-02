trigger IndexManagerTrigger on Index_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexManagerHandler.handleAfterDelete(Trigger.old);
    }
}
