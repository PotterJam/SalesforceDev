trigger RangeConfigTrigger on Range_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeConfigHandler.handleAfterDelete(Trigger.old);
    }
}
