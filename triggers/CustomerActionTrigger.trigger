trigger CustomerActionTrigger on Customer_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerActionHandler.handleAfterDelete(Trigger.old);
    }
}
