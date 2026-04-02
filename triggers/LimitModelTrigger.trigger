trigger LimitModelTrigger on Limit_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitModelHandler.handleAfterDelete(Trigger.old);
    }
}
