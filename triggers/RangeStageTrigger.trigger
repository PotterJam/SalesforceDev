trigger RangeStageTrigger on Range_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeStageHandler.handleAfterDelete(Trigger.old);
    }
}
