trigger LevelRecordTrigger on Level_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelRecordHandler.handleAfterDelete(Trigger.old);
    }
}
