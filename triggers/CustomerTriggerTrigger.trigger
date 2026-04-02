trigger CustomerTriggerTrigger on Customer_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
