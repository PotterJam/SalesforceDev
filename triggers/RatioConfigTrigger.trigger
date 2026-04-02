trigger RatioConfigTrigger on Ratio_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioConfigHandler.handleAfterDelete(Trigger.old);
    }
}
