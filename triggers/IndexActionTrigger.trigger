trigger IndexActionTrigger on Index_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexActionHandler.handleAfterDelete(Trigger.old);
    }
}
