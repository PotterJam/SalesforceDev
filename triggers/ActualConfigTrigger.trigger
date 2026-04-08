trigger ActualConfigTrigger on Actual_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualConfigHandler.handleAfterDelete(Trigger.old);
    }
}
