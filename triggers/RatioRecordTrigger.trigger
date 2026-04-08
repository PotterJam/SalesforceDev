trigger RatioRecordTrigger on Ratio_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioRecordHandler.handleAfterDelete(Trigger.old);
    }
}
