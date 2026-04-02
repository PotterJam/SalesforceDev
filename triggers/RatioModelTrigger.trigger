trigger RatioModelTrigger on Ratio_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioModelHandler.handleAfterDelete(Trigger.old);
    }
}
