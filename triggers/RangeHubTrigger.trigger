trigger RangeHubTrigger on Range_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeHubHandler.handleAfterDelete(Trigger.old);
    }
}
