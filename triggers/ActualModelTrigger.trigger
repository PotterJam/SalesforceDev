trigger ActualModelTrigger on Actual_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualModelHandler.handleAfterDelete(Trigger.old);
    }
}
