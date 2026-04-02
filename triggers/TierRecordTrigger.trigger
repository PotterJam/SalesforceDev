trigger TierRecordTrigger on Tier_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierRecordHandler.handleAfterDelete(Trigger.old);
    }
}
