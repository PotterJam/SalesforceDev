trigger TerritoryRecordTrigger on Territory_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryRecordHandler.handleAfterDelete(Trigger.old);
    }
}
