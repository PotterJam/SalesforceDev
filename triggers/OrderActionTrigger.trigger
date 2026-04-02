trigger OrderActionTrigger on Order_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderActionHandler.handleAfterDelete(Trigger.old);
    }
}
