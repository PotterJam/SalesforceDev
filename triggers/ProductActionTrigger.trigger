trigger ProductActionTrigger on Product_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductActionHandler.handleAfterDelete(Trigger.old);
    }
}
